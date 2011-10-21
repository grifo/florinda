brain.addPattern 'reloadServer',
    match: [/^(reload|restart)\s+?$/i]
    fn: (user, m, cb) ->
        switch m[1]
            when 'reload' then reloadServer()
            when 'restart' then restartServer()