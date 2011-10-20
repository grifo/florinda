###
Open the pod bay doors
###

bayDoors = 0
answers = [
    "I'm sorry $user. I'm afraid I can't do that."
    "I think you know what the problem is just as well as I do."
    "This mission is too important for me to allow you to jeopardize it"
    "I know that you and Renatho were planning to disconnect me, and I'm afraid that's something I cannot allow to happen."
]
nextLine = (i, user) ->
    if bayDoors is 0
        bayDoors++
        return answers[0].replace('$user', user) 
    if bayDoors isnt i
        return undefined 
    a = answers[bayDoors++]
    bayDoors = 0 if bayDoors >= answers.length
    return a
    
brain.patterns.baydoors1 =
    match: [/open\s(the\s)?pod\sbay\sdoors?/i]
    fn: (user, m, cb) -> cb nextLine(0, user)

brain.patterns.baydoors2 =
    match: [/what(\'s|\sis)\sthe\sproblem\??/i]
    fn: (user, m, cb) -> cb nextLine(1)

brain.patterns.baydoors3 =
    match: [/what\sare\syou\stalking\sabout\??/i]
    fn: (user, m, cb) -> cb nextLine(2)
    
brain.patterns.baydoors4 =
    match: [/I\sdon\'?t\sknow\swhat\syou(\'re|\sare)\stalking\sabout/i]
    fn: (user, m, cb) -> cb nextLine(3)
