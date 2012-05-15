
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
        setTimeout (-> respond "@#{user}, #{text} now."), time
        respond "Ok, I'll remind you."

setSayTimer = (time, text, user, respond) ->
    time = parseTimeString time
    if time
        setTimeout (-> respond "#{text}"), time
        respond "Ok."
        
count = (num, dir, down, respond) ->
    num = +num
    
    countdown = dir is 'from' or down
    
    if countdown
        target = 0
    else
        target = num
        num = 1
        
    if (countdown and 0 < num < 90) or (not countdown and 0 < target < 90)
        
        next = ->
            if num is target
                if dir is 'from' then respond brain.anyOf [
                    "Bam!"
                    "Bang!"
                    "Pow!"
                    "0"
                    "Kaboom!"
                    "Sequence completed."
                    "Done."
                ]
                else respond num
                return
            else
                respond num       
            if countdown
                num--
                setTimeout(next, 1000) if num >= 0
                console.log "timer from #{num}"
            else
                num++
                setTimeout(next, 1000) if num <= target
                console.log "timer to #{num}"
            
        setTimeout next, 1000
    
    else if num > 1000
        respond brain.anyOf [
            "Sure."
            "Yeah."
            "Of course."
            "Why don't *you* do that?"
        ]
    else
        respond brain.anyOf [
            "How long would that take?"
            "I don't have time for that."
        ]
        
brain.addPattern 'timer',
    match: /set (timer|alarm|reminder) (?:to )?(.*)/i
    fn: (user, m, cb) -> setTimer m[2], user, cb
    
brain.addPattern 'reminder',
    match: /remind (\w+) (?:to|of|about) (.+) in (.+)/i
    fn: (user, m, cb) -> setReminder m[3], m[2], (if m[1] == 'me' then user else m[1]), cb
    
brain.addPattern 'sayTimer',
    match: /say (.+) in (.+)/i
    fn: (user, m, cb) -> setSayTimer m[2], m[1], user, cb
    
# countdown from 9 -> 9, 8, 7, ...
# count to 5 -> 1, 2, 3, 4, 5
brain.addPattern 'countdown',
    match: /count(down)? ?(from|to)? (\d+)/i
    fn: (user, m, cb) -> count m[3], m[2], m[1], cb
    