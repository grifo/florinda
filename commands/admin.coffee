{ exec } = require 'child_process'

brain.patterns.reload =
    match: [/^reload\syourself/i]
    fn: (user, m, cb) ->
        exec 'git pull && forever restart florinda.js', (error, stdout, stderr) ->
            if error
                cb "Aaaarrgh! I'm hurt"
            else
                # nada, esse processo vai ter morrido
                
brain.patterns.restart =
    match: [/^restart\syourself/i]
    fn: (user, m, cb) ->
        exec 'forever restart florinda.js', (error, stdout, stderr) ->
            if error
                cb "Aaaarrgh! I'm hurt"
            else
                # nada, esse processo vai ter morrido