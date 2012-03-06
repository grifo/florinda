request  = require 'request'
qs       = require 'querystring'
fs       = require 'fs'
crypto   = require 'crypto'
{ exec } = require 'child_process'

## Print commands

SALT = 'seasalt'

downloadFile = (url, callback) ->

    parts = url.match(/([^\/&|><]+)\.(txt|pdf|doc|ppt|pps|xls|odt|ods|odp|jpg||jpeg|gif|png)$/)
    
    [nil, filename, extension] = parts or []
    
    if not filename? or not extension?
        callback brain.anyOf [
            "Invalid file. What are you trying to do?"
            "Invalid file. What are you trying to accomplish?"
            "Hmm. That file won't work."
            "There's something wrong with that file..."
            "I don't like the looks of that file. Please keep it away from me."
            "I can't."
            "I can't, unfortunately."
            "That file is not acceptable."
        ]
        return
    
    # generate hash from filename
    tempName = crypto.createHmac('sha1', SALT).update(filename).digest('hex')
    tempFile = "/var/tmp/#{tempName}.#{extension}"
    
    # save file to /var/tmp
    console.log "downloading #{url}" if program.verbose
    fileStream = fs.createWriteStream tempFile, { flags: 'w+' }
    request.get(url).pipe(fileStream)
    
    fileStream.on 'close', ->
        console.log "file downloaded: #{tempFile}" if program.verbose
        callback null, tempFile, filename, extension
        
    fileStream.on 'error', ->
        console.log "Error downloading file #{filename}" if program.verbose
        callback "Sorry, I couldn't download your file."
        
printFile = (user, url, respond) ->
    downloadFile url, (err, path, filename, ext) ->
        if err
            respond err
            return
        if ext in "doc|ppt|pps|xls|odt|ods|odp".split('|')
            command = "openoffice -headless -norestore -p '#{path}'"
        if ext in "jpg|jpeg|gif|png|bmp".split('|')
            command = "lpr -o ppi=96 '#{path}'"
        else
            command = "lpr '#{path}'"
        
        florinda.say "Printing #{filename}.#{ext}"
        exec command, (err, stdout, stderr) ->
            if err
                console.log "failed: #{command}" if program.verbose
                respond "Print command failed. I swear it's not my fault."
            else
                respond "Yay! It should be coming out of the printer in a sec."

# print http://domain.com/file.doc
# print file http://domain.com/file.doc
# print from http://domain.com/file.doc
brain.addPattern 'print',
    match: [
        /print\s?(?:file|url|from)?\s((?:https?|ftp):\/\/.*)/i
    ]
    fn: (user, m, cb) ->
        brain.confirm
            fn: printFile
            args: [user, m[1], cb]
            cancelMessage: "Print job canceled."
            confirmMessage: "Okay."
        cb "Are you sure you want to print #{m[1]}?"
###