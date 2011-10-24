request   = require 'request'
qs        = require 'querystring'
{ DomJS } = require 'dom-js'

API_KEY = '3EWK75-KVARQJH55Q'

###
Wolfram Alpha
###

brain.wolframSearch = (query, respond) ->

    message = ''
    
    url = 'http://api.wolframalpha.com/v2/query?' + qs.stringify(
        input  : query
        appid  : API_KEY
        format : ['plaintext']
    )
    
    console.log "requesting #{url}" if program.verbose
    request.get url, (err, resp, body) ->
        
        parser = new DomJS
        message = ''

        parser.parse body, (err, root) ->
            try
                [result] = root.children.filter (node) ->
                    node.name is 'pod' and /Result/.test node.attributes.id

                if !result
                    [result] = root.children.filter (node) ->
                        node.name is 'pod' and
                        node.attributes.id is 'Input'

                [rsubpod] = result.children.filter (node) -> node.name is 'subpod'
                [rtext] = rsubpod.children.filter (node) -> node.name is 'plaintext'

                message = rtext.firstChild().text
            catch e
                message = null
                
            try
                pods = root.children.filter (node) -> node.name is 'pod' and node.attributes.id isnt 'Result'
                for pod in pods
                    if message.length > 1000 then break
                    subpods = pod.children.filter (node) -> node.name is 'subpod'
                    for subpod in subpods
                        if message.length > 1000 then break
                        [text] = subpod.children.filter (node) -> node.name is 'plaintext'
                        message += "\n#{[text.firstChild().text]}"
            catch e
                message += ''
        
        respond message
