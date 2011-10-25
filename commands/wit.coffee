## Absolutely required

brain.addAct 'openPodBayDoors', new brain.Act [
    "I'm sorry $user. I'm afraid I can't do that."
    "I think you know what the problem is just as well as I do."
    "This mission is too important for me to allow you to jeopardize it."
    "I know that you and Renatho were planning to disconnect me, and I'm afraid that's something I cannot allow to happen."
], [
    /open\s(the\s)?pod\sbay\sdoors?/i
    /what(\'s|\sis)\sthe\sproblem\??/i
    /what\sare\syou\stalking\sabout\??/i
    /I\sdon\'?t\sknow\swhat\syou(\'?re|\sare)\stalking\sabout/i
]