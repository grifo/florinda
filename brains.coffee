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
            
    Act: class Act
        constructor: (@answers = [], @phrases = []) ->
            @line = 0

        nextLine: (stage, user, respond) ->
            if @line isnt stage
                respond '...'
                return
            answer = @answers[@line].replace '$user', user
            @line += 1
            @line = 0 if @line >= @answers.length
            respond answer
            # reset line after 30 seconds
            setTimeout (=> @line = 0), 15000
            return

        match: (input) ->
            for phrase, i in @phrases when phrase.test input
                return i
    
    addAct: (name, act) ->
        brain.addPattern name,
            match: act.phrases
            fn: (user, m, cb) -> act.nextLine m.index, user, cb
    
    receive: (user, command, respond) ->
        
        console.log "received command #{command}" if program.verbose
        
        ## clean-up command string
        # removes link references added by iChat
        command = command.trim().replace /\s?\<[^>]+\>/g, ''
        
        matched = do =>
            for own name, pattern of @patterns
                for match, i in pattern.match
                    if matches = command.match match
                        matches.index = i
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