###
ipad2 with iOS 5
###

brain.addPattern 'ipad2',
    match: /ipad\s?2\s.*\siOS(\s?)5/i
    fn: (user, m, cb) -> cb "http://i.imgur.com/VYyQk.gif"