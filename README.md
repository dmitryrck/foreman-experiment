For all examples my `.env` is exactly equals to:

```
PORT="3000"
```
And my `Procfile`:

```
web: bundle exec rackup config.ru -p $PORT
web-dev: bundle exec rackup config.ru -p $PORT
```

# Two instances

If you start _two instances of same line_ (e. g., `foreman start 'web=2'`) you
will get _one instance_ in the port `3000` and _another one_ in the port
`3001`.

    %  foreman start 'web=2'
    10:26:03 web.1  | started with pid 8474
    10:26:03 web.2  | started with pid 8475
    10:26:06 web.1  | [2016-03-22 10:26:06] INFO  WEBrick 1.3.1
    10:26:06 web.2  | [2016-03-22 10:26:06] INFO  WEBrick 1.3.1
    10:26:06 web.1  | [2016-03-22 10:26:06] INFO  ruby 2.3.0 (2015-12-25) [x86_64-linux]
    10:26:06 web.1  | [2016-03-22 10:26:06] INFO  WEBrick::HTTPServer#start: pid=8474 port=3000
    10:26:06 web.2  | [2016-03-22 10:26:06] INFO  ruby 2.3.0 (2015-12-25) [x86_64-linux]
    10:26:06 web.2  | [2016-03-22 10:26:06] INFO  WEBrick::HTTPServer#start: pid=8475 port=3001

# The second line

If you start the _first and the second line_ you will get _one_ listening on
port `3000` and _another_ in the port `3100`.

    %  foreman start 'web=1,web-dev=1'
    10:28:18 web.1     | started with pid 8921
    10:28:18 web-dev.1 | started with pid 8922
    10:28:20 web-dev.1 | [2016-03-22 10:28:20] INFO  WEBrick 1.3.1
    10:28:20 web-dev.1 | [2016-03-22 10:28:20] INFO  ruby 2.3.0 (2015-12-25) [x86_64-linux]
    10:28:20 web-dev.1 | [2016-03-22 10:28:20] INFO  WEBrick::HTTPServer#start: pid=8922 port=3100
    10:28:20 web.1     | [2016-03-22 10:28:20] INFO  WEBrick 1.3.1
    10:28:20 web.1     | [2016-03-22 10:28:20] INFO  ruby 2.3.0 (2015-12-25) [x86_64-linux]
    10:28:20 web.1     | [2016-03-22 10:28:20] INFO  WEBrick::HTTPServer#start: pid=8921 port=3000

Even if you start only the _line two_:

    %  foreman start 'web-dev=1'
    10:33:26 web-dev.1 | started with pid 10011
    10:33:28 web-dev.1 | [2016-03-22 10:33:28] INFO  WEBrick 1.3.1
    10:33:28 web-dev.1 | [2016-03-22 10:33:28] INFO  ruby 2.3.0 (2015-12-25) [x86_64-linux]
    10:33:28 web-dev.1 | [2016-03-22 10:33:28] INFO  WEBrick::HTTPServer#start: pid=10011 port=3100

# The mix :P

If you start two of each lines you will get:

    %  foreman start 'web=2,web-dev=2'
    10:29:45 web.1     | started with pid 9218
    10:29:45 web.2     | started with pid 9219
    10:29:45 web-dev.1 | started with pid 9220
    10:29:45 web-dev.2 | started with pid 9222
    10:29:49 web.2     | [2016-03-22 10:29:49] INFO  WEBrick 1.3.1
    10:29:49 web-dev.1 | [2016-03-22 10:29:49] INFO  WEBrick 1.3.1
    10:29:49 web.2     | [2016-03-22 10:29:49] INFO  ruby 2.3.0 (2015-12-25) [x86_64-linux]
    10:29:49 web-dev.1 | [2016-03-22 10:29:49] INFO  ruby 2.3.0 (2015-12-25) [x86_64-linux]
    10:29:49 web.2     | [2016-03-22 10:29:49] INFO  WEBrick::HTTPServer#start: pid=9219 port=3001
    10:29:49 web-dev.1 | [2016-03-22 10:29:49] INFO  WEBrick::HTTPServer#start: pid=9220 port=3100
    10:29:49 web-dev.2 | [2016-03-22 10:29:49] INFO  WEBrick 1.3.1
    10:29:49 web-dev.2 | [2016-03-22 10:29:49] INFO  ruby 2.3.0 (2015-12-25) [x86_64-linux]
    10:29:49 web-dev.2 | [2016-03-22 10:29:49] INFO  WEBrick::HTTPServer#start: pid=9222 port=3101
    10:29:49 web.1     | [2016-03-22 10:29:49] INFO  WEBrick 1.3.1
    10:29:49 web.1     | [2016-03-22 10:29:49] INFO  ruby 2.3.0 (2015-12-25) [x86_64-linux]
    10:29:49 web.1     | [2016-03-22 10:29:49] INFO  WEBrick::HTTPServer#start: pid=9218 port=3000

Resume:

* `3000`, because it is the first instance of first line;
* `3001`, because it is the second instance of the first line;
* `3100`, because it is the first instance of second line;
* `3101`, because it is the second instance of second line;

That's all folks!
