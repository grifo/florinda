fs       = require 'fs'
{ exec } = require 'child_process'

validateRepo = (repo, respond, next) ->

    if not /^[\w-_]+$/.test repo
        respond "That repository name is invalid."
        return
        
    fs.stat "/var/svn/#{repo}", (err, stats) ->
        if err
            respond "There isn't a repository with this name."
            return
        else
            next()

svnExport = (repo, respond) ->

    validate repo, ->
        
        options = "-q --no-auth-cache --username #{config.svn.username} --password #{config.svn.password}"
        exec "svn export #{options} svn://#{config.svn.url}/#{repo} #{config.svn.path}/#{repo}", (err, stdout, stderr) ->
            if err
                respond "Something bad happened while exporting 0_0"
            else
                respond "Exported to http://#{config.svn.public}/preview/#{repo}"
            return

svnLog = (repo, respond) ->

    validate repo, ->
        
        options = '-l 3 --no-auth-cache --username florinda --password chespirito'
        exec "svn log #{options} svn://localhost/#{repo}", (err, stdout, stderr) ->
            if err
                respond "Couldn't get the logs."
            else
                respond stdout
            return

brain.addPattern 'svn export',
    match: /^svn\sexport\s(.+)/i
    fn: (user, m, cb) -> svnExport m[1], cb

brain.addPattern 'svn log',
    match: /^svn\slog\s(.+)/i
    fn: (user, m, cb) -> svnLog m[1], cb
