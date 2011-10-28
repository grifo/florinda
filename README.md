# Florinda

A bot for our office chat room.

Inspired by [Zach Holman's post on Hubot](https://github.com/blog/968-say-hello-to-hubot) - thanks :)

## Dependencies

* [node.js](http://nodejs.org) (v4)
* [npm](http://npmjs.org)
* [forever](https://github.com/indexzero/forever) (used by default for auto-restart)

Some commands have their own dependencies, choose what you want to use.

## Chat room

Currently it only interfaces with Party Chat (GTalk groups - http://partychapp.appspot.com) via partychat-hooks.appspot.com, but it'd be easy to turn it into an IRC or Jabber bot.

## What can she do?

![](http://grifo.github.com/florinda/images/florinda-hello.png)

Remind you of coffee time:

![](http://grifo.github.com/florinda/images/florinda-reminder.png)

![](http://grifo.github.com/florinda/images/florinda-coffee.png)

Export from an SVN repository:

![](http://grifo.github.com/florinda/images/florinda-svn.png)

Set simple timers:

![](http://grifo.github.com/florinda/images/florinda-timer.png)

Search twitter:

![](http://grifo.github.com/florinda/images/florinda-twitter.png)

Search Google Places:

![](http://grifo.github.com/florinda/images/florinda-places.png)

Answer enthusiastically to interesting questions:

![](http://grifo.github.com/florinda/images/florinda-wolfram.png)

Any commands that don't match anything are sent to Wolfram Alpha as a last attempt.

### Other commands
* *say blah in 10 seconds* (for creeping out people)
* *print http://xxx.com/file.pdf* (uses lpr/openoffice)
* *get someword from twitter*
* *get 5 tweets from jamieoliver*
* *get latest tweet by @zeldman*
* *restart* 
* *reload* (performs a `git pull` from this repo + restart)

New commands can be added to the **/comands** folder. Take a look at `places.coffee` for a simple example.

## Installing

1. `git clone http://github.com/grifo/florinda` to your favorite folder
2. run `npm install`
3. get a [Wolfram Alpha API Key](http://products.wolframalpha.com/api/)
4. create a `config.json` file as shown below
5. [configure a hook](http://partychat-hooks.appspot.com) with the pattern *@florinda*
6. point the POST URL to her public server address
7. `forever start florinda.js -vs` (will run on port 3333 by default)

Alternatively you can run it on the command-line with `node florinda.js --cli` without setting a webhook.

`node florinda.js --help` will show you all available options.

### config.json

(defaults needed for the bundled commands)

    {
        "key": "supersecretkey",
        "messageURL": "http://partychat-hooks.appspot.com/post/p_xxxx",
        "wolfram": {
    	    "apiKey":"1A2B3C"
        },
        "svn": {
            "username": "user",
            "password": "12345",
            "url": "192.168.1.99",
            "path": "/var/www/clients",
            "public": "mydomain.com"
        }
    }


-----

Siga @grifotecnologia e @ricardobeat no twitter :)