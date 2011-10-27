## Absolutely required

brain.addAct 'openPodBayDoors', new brain.Act [
    "I'm sorry $user. I'm afraid I can't do that."
    "I think you know what the problem is just as well as I do."
    "This mission is too important for me to allow you to jeopardize it."
    "I know that you and Renatho were planning to disconnect me, and I'm afraid that's something I cannot allow to happen."
], [
    /open (the )?pod bay doors?/i
    /what(\'s| is) the problem\?*/i
    /what are you talking about\?*/i
    /I don'?t know what you('?re| are) talking about/i
]

brain.addAct 'astley', new brain.Act [
    "Never gonna let you down"
    "Never gonna make you cry"
    "Never gonna tell a lie and hurt you"
], [
    /(I'?m )?Never gonna give (you|u) up/i
    /(I'?m )?Never gonna run around (and|n) desert (you|u)/i
    /(I'?m )?Never gonna say goodbye/i
]