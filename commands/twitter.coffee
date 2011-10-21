request = require 'request'
qs      = require 'querystring'
decode  = require '../lib/entity_decode'

###
Twitter search
###

twitterSearch = (query, respond) ->

    message = ''
    
    url = 'http://search.twitter.com/search.json?' + qs.stringify(
        q   : query
        rpp : 3
    )
    
    console.log "requesting #{url}"
    request.get url, (err, resp, body) ->
        data = JSON.parse body
        
        if data.results
            for tweet in data.results
                message += "#{tweet.from_user}: #{decode tweet.text}\n"
        else
            message = "I'm sorry, nothing found for '#{query}' on twitter."
        
        respond message

# search for shit on twitter
# search shit on twitter
brain.addPattern 'twitter',
    match: [
        /search(?:\sfor)?\s(.+)\son\stwitter/i
        /(?:grab|get|take|find|pull)\s(.+)\s(?:on|from)\stwitter/i
        /search\stwitter(?:\sfor)?\s(.+)/i
    ]
    fn: (user, m, cb) -> twitterSearch m[1], cb
