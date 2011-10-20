qs       = require 'querystring'
url      = require 'url'
http     = require 'http'
brain    = require './brains'
request  = require 'request'
{ exec } = require 'child_process'

try
    config = JSON.parse require('fs').readFileSync 'config.json'
catch e
    config = {}

#####

CHAT_OFF = 'nochat' in process.argv

sendChatMessage = (message) ->
    if CHAT_OFF then return
    
    url = "http://partychat-hooks.appspot.com/post/p_ngvimtvm?" + qs.stringify({ message }).replace(/\'/g, '%27')
    
    console.log "answering: \n#{message}"
    console.log "requesting #{url}"
    request.get url, (err, response, body) ->
        if not err and response.statusCode is 200
            console.log "answer sent"
        else
            console.log "erro #{[err]}"
            
#####

reloadServer = (cb = ->) ->
    exec 'git pull && forever restart florinda.js', (err, stdout, stderr) ->
        if err then cb "Aaaarrgh! I'm hurt"
        
restartServer = (cb) ->
    exec 'forever restart florinda.js', (err, stdout, stderr) ->
        if err then cb "Aaaarrgh! I'm hurt"

#####

sendChatMessage 'Hello!'

server = http.createServer (req, res) ->

    pattern = ///
        \[             # opening bracket
        ([^\]]+)       # user name (anything NOT a closing bracket)
        \]             # closing bracket
        \s             # space
        florinda\,\s?  # partyhook pattern + optional space
        (.+)           # command given
    ///
    
    
    if req.method is 'GET'
        
        params = url.parse(req.url, true).query
        
        console.log params
        
        if params?.reload == 1 && params.key == config.key
            console.log "** RELOADING **"
            reloadServer()
            return
        
        if params?.restart == 1 && params.key == config.key
            console.log "** RESTARTING **"
            reloadServer()
            return
        
        command = params?.command
        
        if command
            
            user = 'john'
            #command = command.replace /\s?\<.+\>\/g, ''

            console.log """
            ****************************************
            received command **#{command}**
            """
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
        
            query = qs.parse(body)?.body
            if query and matches = query.match(pattern)
            
                [user, command] = matches.slice(1)
                #command = command.replace /\s?\<.+\>/g, ''
        
                console.log "received command #{command}"
                brain.receive user, command, sendChatMessage
        
        res.end()

#####

PORT = 3333

server.listen PORT
console.log "server running on port #{PORT}"
