qs       = require 'querystring'
url      = require 'url'
http     = require 'http'
brain    = require './brains'
request  = require 'request'
{ exec } = require 'child_process'

#####

sendChatMessage = (message) ->
    url = "http://partychat-hooks.appspot.com/post/p_ngvimtvm?" + qs.stringify({ message }).replace(/\'/g, '%27')
    
    console.log "sending #{url}"
    request.get url, (err, response, body) ->
        if not err and response.statusCode is 200
            console.log "answer sent"
        else
            console.log "erro #{[err]}"
            
#####

reloadServer = (cb) ->
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
        
        query = url.parse(req.url, true).query?.body
        if query and matches = query.match(pattern)

            [user, command] = matches.slice(1)
            #command = command.replace /\s?\<.+\>\/g, ''

            console.log """
            ****************************************
            received command **#{command}**
            """
            brain.receive user, command, (answer) ->

                res.writeHead 200, { "Content-Type": 'text/plain' }
                res.end answer

        else
            res.end 'shit'
        
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
                brain.receive user, command, (answer) ->
                    sendChatMessage anser
        
        res.end()

#####

PORT = 3333

server.listen PORT
console.log "server running on port #{PORT}"
