brain.addPattern 'reloadServer',
    match: [/^\s?(reload|restart)\s*$/i]
    fn: (user, m, cb) ->
        switch m[1]
            when 'reload' then florinda.reload()
            when 'restart' then florinda.restart()