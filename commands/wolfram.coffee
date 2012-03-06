request   = require 'request'
qs        = require 'querystring'
{ DomJS } = require 'dom-js'

## Wolfram Alpha

###
TODO:
 - find a decent XML module with DOM methods
 - handle different types of pods more intelligently
   (http://products.wolframalpha.com/api/documentation.html)
 - rewrite everything
###

brain.wolframSearch = (query, respond) ->

    message = ''
    
    url = 'http://api.wolframalpha.com/v2/query?' + qs.stringify(
        input  : query
        appid  : config.wolfram.apiKey
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
                pods = root.children
                for pod in pods
                    continue if /Result|UnitConversion|:Expanded/.test pod.attributes.id
                    if message.length > 800 then break
                    subpods = pod.children.filter (node) -> node.name is 'subpod'
                    for subpod in subpods
                        if message.length > 800 then break
                        [text] = subpod.children.filter (node) -> node.name is 'plaintext'
                        message += "\n#{[text.firstChild().text]}"
            catch e
                message += ''
        
        respond message
