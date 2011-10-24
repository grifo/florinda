request = require 'request'
qs      = require 'querystring'
decode  = require '../lib/entity_decode'

###
Twitter search
###

`
function relativeTime(dat){
	var s = ~~( (+new Date-Date.parse(dat)) / 1000 );
	// unidade de tempo
	var un = (s<60) ? 'second'
		: (s /= 60)<60 ? 'minute'
		: (s /= 60)<24 ? 'hour'
		: (s /= 24)<30.4 ? 'day'
		: (s /= 30.4)<365 ? 'month'
		: 'ano';
	s = Math.floor(s);
	un += (s>1 || s == 0) ? 's' : '';
	
	  return s + ' ' + un + ' ago';
};
`

twitterSearch = (query, respond) ->

    message = ''
    
    url = 'http://search.twitter.com/search.json?' + qs.stringify(
        q   : query
        rpp : 3
    )
    
    console.log "requesting #{url}" if program.verbose
    request.get url, (err, resp, body) ->
        data = JSON.parse body
        
        if data.results
            for tweet in data.results
                created = tweet.created_at
                message += "#{tweet.from_user}: #{decode tweet.text} (#{relativeTime created})\n"
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

