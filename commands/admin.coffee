brain.patterns.reloadServer =
    match: [/^(reload|restart)\syourself/i]
    fn: (user, m, cb) ->
        switch m[1]
            when 'reload' then reloadServer cb
            when 'restart' then restartServer cb