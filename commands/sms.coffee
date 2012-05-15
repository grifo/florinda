request = require 'request'
qs      = require 'querystring'

## SMS messages

sendMessage = (numbers, message, user, respond) ->

    if ',' in numbers
        numbers = numbers.split(',').map (n) -> n.trim()
    else
        numbers = [numbers]

    people = config.sms.numbers
        
    sent = 0

    for number in numbers
        
        if isNaN number
            number = people[number].toString()
            if not number?
                respond "I don't know this person."
                return
    
        else if number.length isnt 10 and number.length isnt 8
            respond "mobile number must be 8 or 10 digits long."
            return
        
        url = "http://sms.3ring.com.br/enviar_mensagem?" + qs.stringify(
            u: config.sms.user
            p: config.sms.password
            n: number
            m: message.substring(0, 160)
            r: user
        )
        
        request.get url, (err, resp, body) ->
            if err
                respond "Error sending message to #{number}. Try again later."
                return
        
            if body is 'erro 003 numero invalido'
                respond "Invalid phone number."
                return
            
            if body is 'ok'
                sent++
                if sent is numbers.length
                    respond "#{sent} #{if sent is 1 then 'message' else 'messages'} sent (#{numbers.join(', ')})."
            else
                respond "Error: #{body}"
                
            
        
# message 5199998888 puta que pariu pra fora
# message jean, vitor bla bla blabla
brain.addPattern 'sms',
    match: /(?:message|sms|send sms)(?: to)? ((?:\w+(?:, ?)?)+) (.*)/i
    fn: (user, m, cb) -> sendMessage m[1], m[2], user, cb