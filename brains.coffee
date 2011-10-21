request = require 'request'
qs      = require 'querystring'
fs      = require 'fs'

module.exports = global.brain =
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
        
        ## clean-up command string
        # removes link references added by iChat
        command = command.trim().replace /\s?\<[^>]+\>/g, ''

        matched = do ->
            for own name, pattern of @patterns
                for match, i in pattern.match
                    if matches = command.match match
                        console.log "matched service: #{name}"
                        pattern.fn user, matches, respond
                        return true
                    
        if not matched
            brain.wolframSearch command, (answer) ->
                return respond answer if answer
                console.log "didn't understand #{command}"
                answers = [
                    "I don't know what you're talking about"
                    "I don't understand"
                    "What do you mean?"
                    "WTF"
                ]
                respond answers[ Math.floor(Math.random() * (answers.length+.99)) ]


# load brain files
for file in fs.readdirSync './commands'
    if /^\w+\.coffee$/.test file
        try
            console.log "loaded #{file}"
            require "./commands/#{file}"
        catch e
            console.log "error loading #{file}"