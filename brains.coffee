request = require 'request'
qs      = require 'querystring'
fs      = require 'fs'

module.exports =
    # returns a random one from an array of strings
    anyOf: (answers) -> answers[ Math.floor(Math.random() * (answers.length+.99)) ]
    # confirm some action
    queued: []
    confirm: (obj) ->
        @queued.push obj #{ confirmMessage, cancelMessage, fn, args }
    # detection patterns
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
            # confirmations
            if brain.queued.length > 0
                console.log command
                if /^yes|yeah|sure|ok(\s\!\.;)*$/i.test command
                    service = brain.queued.pop()
                    florinda.say service.confirmMessage
                    service.fn?.apply null, service.args
                    return true
                else if /^no|nope|not|cancel|stop(\s\!\.;)*$/i.test command
                    service = brain.queued.pop()
                    florinda.say service.cancelMessage or "Canceled."
                    return true
            
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
                respond brain.anyOf [
                    "I don't know what you're talking about."
                    "I have no idea what you are talking about."
                    "What the fuck is wrong with you?"
                    "I wish I could understand you."
                    "I don't understand."
                    "What do you mean?"
                    "WTF!"
                    "There's only so much I can do."
                    "You're annoying."
                    "Leave me alone."
                    "I don't feel like it."
                ]