fs       = require 'fs'
qs       = require 'querystring'
url      = require 'url'
http     = require 'http'
request  = require 'request'
{ exec } = require 'child_process'
program  = require 'commander'

florinda = require './system'
brain    = require './brains'

## Command-line options
program
    .option('-n, --nochat', "Don't send messages")
    .option('-s, --silent', "Don't send greeting on start")
    .option('-v, --verbose', "Verbose mode, useful for debugging requests")
    .option('-c, --cli', "Command-line mode")
    .option('-u, --user [name]', 'Username for CLI/testing', 'John')
    .parse process.argv

if program.cli
    program.nochat = program.silent = true

## Load config
try
    config = JSON.parse fs.readFileSync './config.json', 'utf8'
catch e
    config = {}

## Make main objects global
# yeah, I could keep passing stuff around...
global.program  = program
global.florinda = florinda
global.brain    = brain

## Load commands
for file in fs.readdirSync './commands'
    if /^\w+\.coffee$/.test file
        try
            require "./commands/#{file}"
            console.log "loaded #{file}" if program.verbose
        catch e
            console.log "error loading #{file}"
            
## Create HTTP server
server = http.createServer (req, res) ->

    pattern = ///
        \[             # opening bracket
        ([^\]]+)       # user name (anything NOT a closing bracket)
        \]             # closing bracket
        \s             # space
        @florinda\s?   # partyhook pattern + optional space
        (.+)           # command given
    ///
    
    params = url.parse(req.url, true).query
    
    if req.method is 'GET'
        
        if params?.reload == '1' and params.key == config.key
            console.log "** RELOADING **"
            res.end "** RELOADING **"
            florinda.reload()
            return
        
        if params?.restart == '1' and params.key == config.key
            console.log "** RESTARTING **"
            res.end "** RESTARTING **"
            florinda.restart()
            return
        
        command = params?.command
        
        if command
            
            user = 'john'
            brain.receive user, command, (answer) ->

                res.writeHead 200, { "Content-Type": 'text/plain' }
                res.end answer

        else
            res.end 'no command'
        
    else if req.method is 'POST'
    
        body = ''
    
        req.on 'data', (data) ->
            body += data
    
        req.on 'end', ->
        
            # someone pushed to github, reload
            try
                payload = JSON.parse qs.parse(body).payload
            catch e
                payload = null
                
            if payload and params?.reload == '1' and params.key == config.key
                console.log "** RELOADING (push) **"
                res.end "** RELOADING (push) **"
                florinda.say "#{payload.commits[0]?.author.name} pushed to github, restarting..."
                florinda.reload()
                return
        
            query = qs.parse(body)?.body
            if query and matches = query.match(pattern)
            
                [user, command] = matches.slice(1)
                brain.receive user, command, florinda.say
                return
            
            res.end()


## Hello!
if not program.silent then florinda.say 'Hello!'

## Enter command-line mode
if program.cli
    console.log "## Command-line mode:"
    waitForInput = ->
        program.prompt 'you: ', (command) ->
            brain.receive program.user, command, (answer) -> 
                console.log answer
                waitForInput()
    waitForInput()

## Start HTTP server
else
    PORT = 3333
    server.listen PORT
    console.log "server running on port #{PORT}"
