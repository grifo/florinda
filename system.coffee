module.exports = 

    say: (message) ->

        console.log "sending message: \n#{message}" if program.verbose

        if program.nochat then return
    
        chatURL = config.messageURL + "?" + qs.stringify({ message }).replace(/\'/g, '%27')
    
        console.log "requesting #{chatURL}" if program.verbose
        request.get chatURL, (err, response, body) ->
            if not err and response.statusCode is 200
                console.log "answer sent" if program.verbose
            else
                console.log "erro #{[err]}"

    reload: () ->
        if not msg then florinda.say 'Restarting...'
        exec 'git pull', (err, stdout, stderr) ->
            if err
                console.log "git pull failed" if program.verbose
                florinda.say "Failed to update :/"
            else
                console.log stdout
                florinda.say stdout.trim()
                setTimeout restartServer, 1000
        
    restart: ->
        exec 'forever restart florinda.js', (err, stdout, stderr) ->
            if err
                console.log "Error running forever restart"
                florinda.say "Aaaarrgh! I'm hurt"
