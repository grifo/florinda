# Florinda

A bot for our office chat room.

Inspired by [Hubot](https://github.com/blog/968-say-hello-to-hubot) - thanks github :)

## Dependencies

* [node.js](http://nodejs.org) (v4)
* [npm](http://npmjs.org)
* [forever](https://github.com/indexzero/forever) (used by default for auto-restart)

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

Answer about general facts:

![](http://grifo.github.com/florinda/images/florinda-reload.png)

(that's Wolfram Alpha).

She reloads itself when you add a script:

![](http://grifo.github.com/florinda/images/florinda-reload.png)

New commands can be added to the **/comands** folder. Take a look at `places.coffee` for a simple example.

## Installing

1. `git clone http://github.com/grifo/florinda` to your favorite folder.
2. create a `config.json` file as shown below
3. configure a hook at http://partychat-hooks.appspot.com with the pattern *@florinda*
4. point the POST url to her public address
4. `forever start florinda.js -vs` (will run on port 3333 by default)

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