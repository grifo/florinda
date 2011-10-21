request = require 'request'
qs      = require 'querystring'
fs      = require 'fs'

module.exports =
    patterns: {}
    addPattern: (name, p) ->
        if not @patterns[name]?
            # allow single regular expression
            if p.match instanceof RegExp
                p.match = [p.match]
            @patterns[name] = p
        else
            console.log "A pattern called #{name} already exists"
    
    receive: (user, command, respond) ->
        
        console.log "received command #{command}" if program.verbose
        
        ## clean-up command string
        # removes link references added by iChat
        command = command.trim().replace /\s?\<[^>]+\>/g, ''
        
        matched = do =>
            for own name, pattern of @patterns
                for match, i in pattern.match
                    if matches = command.match match
                        console.log "matched service: #{name}" if program.verbose
                        pattern.fn user, matches, respond
                        return true
            return false
                    
        if not matched
            brain.wolframSearch command, (answer) ->
                return respond answer if answer
                console.log "I couldn't understand #{command}"  if program.verbose
                answers = [
                    "I don't know what you're talking about"
                    "I don't understand"
                    "What do you mean?"
                    "WTF"
                ]
                respond answers[ Math.floor(Math.random() * (answers.length+.99)) ]