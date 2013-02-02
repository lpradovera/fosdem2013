# FOSDEM 2013 Adhearsion demo

Clone the repo and let's get started! Firstly, you'll need to configure your VoIP platform:

## Asterisk

Edit `extensions.conf` to include the following:

```
[your_context_name]
exten => _.,1,AGI(agi:async)
```

and setup a user in `manager.conf` with read/write access to `all`.

If you are using Asterisk 1.8, you will need to add an additional empty context with the name `adhearsion-redirect`. On Asterisk 10 and above this is auto-provisioned.

## Starting the app
Use "bundle install" then "foreman start" to get everything running.

The application starts an Adhearsion process with an embedded Reel server on port 8080, and a Sinatra support app on port 8989.

Go to http://localhost:8989 to see the home page for the demos.

You will need a SIP client configured to connect to your Asterisk server as SIP/100 and one as SIP/200 to fully use the demo.

After configuring your clients, just try dialing 123 or 456.

For the PIN demo, the PIN is 1234.

## Cool! Tell me more!

More detail is available in the [deployment documentation](http://adhearsion.com/docs/best-practices/deployment).

Check out [the Adhearsion website](http://adhearsion.com) for more details of where to go from here.
