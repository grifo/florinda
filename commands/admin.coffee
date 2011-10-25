brain.addPattern 'reloadServer',
    match: [/^\s?(reload|restart)\s*$/i]
    fn: (user, m, cb) ->
        if m[1] is 'reload'
            florinda.say "Reloading..."
            florinda.reload()
        else if m[1] is 'restart'
            florinda.say "Restarting..."
            florinda.restart()
            
brain.addPattern 'say',
    match: [/^say\s(.*)/i]
    fn: (user, m, cb) -> cb m[1]