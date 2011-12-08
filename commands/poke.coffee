## Poke

# poke vitor
# ☞ @vitor
brain.addPattern 'poke',
    match: /poke (\w+)/i
    fn: (user, m, cb) -> cb "☞ @#{m[1]}"