request = require 'request'
qs      = require 'querystring'
decode  = require '../lib/entity_decode'

## Twitter search

n_tweets = 3

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

searchByString = (query, respond) ->
    twitterSearch {
        q   : query
        rpp : n_tweets
    }, respond
    
searchByUser = (user, plural, n, respond) ->
    if not n?
        n = if plural then n_tweets else 1
    else if isNaN n
        n = 1
    twitterSearch {
        q   : "from:#{user.replace('@', '')}"
        rpp : n or 1
    }, respond
    
twitterSearch = (params, respond) ->
    
    message = ''
    url = 'http://search.twitter.com/search.json?' + qs.stringify(params)
    
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
    fn: (user, m, cb) -> searchByString m[1], cb
    
# get tweets from @user
# get 5 tweets from user
# get last tweet from user
brain.addPattern 'twitterUser',
    match: [
        /(?:grab|get|take|find|pull)\s?(\d+|last|latest)?\stweet(s?)\s(?:from|by)\s(\S+)/i
    ]
    fn: (user, m, cb) -> searchByUser m[3], m[2], m[1], cb

