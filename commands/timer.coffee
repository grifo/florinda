
parseTimeString = (str, debug) ->

    pattern = ///
        (                               # start main group
          \d+                           # digits
          (?:\s*)                       # optional spaces
          (                             # start unit
              d (?=ays)?                # days
            | m (?=inutes|ins|in)?      # minutes
            | h (?=ours|rs|r)?          # hours
            | s (?=econds|ecs|ec)?      # seconds
          )?                            # end unit
        )                               # end main group, repeat as needed
    ///gi

    parts = str.match pattern

    units = 'dhms'

    pos = (part) ->
        index = units.indexOf part.substr -1
        return 999 if index < 0 # no unit
        return index

    parts = parts.sort (a, b) ->
        return 1 if pos(a) > pos(b)
        return -1 if pos(a) < pos(b)
        return 0
    
    unitValues =
        d: 1000*60*60*24
        h: 1000*60*60
        m: 1000*60
        s: 1000

    time = 0

    parts = for part in parts
        # remove whitespace
        part = part.replace /\s/g, ''
        unit = part.substr(-1)
        # guess unit if missing
        if units.indexOf(unit) < 0
            part += unit = units[units.indexOf(lastUnit)+1]
        lastUnit = unit
        val = parseInt part
        time += val * unitValues[unit]
        part
        
    return [parts, time] if debug?
    return time
    
    
setTimer = (time, user, respond) ->
    time = parseTimeString time
    if time
        setTimeout (-> respond "Timer ended [#{user}]"), time
        respond "Timer set."
        
setReminder = (time, text, user, respond) ->
    time = parseTimeString time
    if time
        setTimeout (-> respond "#{user}, #{text} now."), time
        respond "Ok, I'll remind you."

setSayTimer = (time, text, user, respond) ->
    time = parseTimeString time
    if time
        setTimeout (-> respond "#{text}"), time
        respond "Ok."
        
brain.addPattern 'timer',
    match: [/set\s(timer|alarm|reminder)(\sto)?(.+)/i]
    fn: (user, m, cb) -> setTimer m[3], user, cb
    
brain.addPattern 'reminder',
    match: [/remind\s(.+)\s(to|of|about)\s(.+)\sin\s(.+)/i]
    fn: (user, m, cb) -> setReminder m[4], m[3], if m[2] == 'me' then user else m[2], cb
    
brain.addPattern 'sayTimer',
    match: [/say\s(.+)\sin\s(.+)/i]
    fn: (user, m, cb) -> setSayTimer m[2], m[1], user, cb