brain.addPattern 'reloadServer',
    match: [/^(reload|restart)/i]
    fn: (user, m, cb) ->
        if m[1] is 'reload'
            florinda.say "Reloading..."
            florinda.reload()
        else if m[1] is 'restart'
            florinda.say "Restarting..."
            florinda.restart()
            
brain.addPattern 'say',
    match: /^say (.*)/i
    fn: (user, m, cb) -> cb m[1]