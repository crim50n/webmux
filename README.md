webmux
======

**webmux** is an open-source web based SSH terminal multiplexer.

webmux uses the Twisted framework for Python, Backbone.js, and sockjs.

Running webmux
--------------

To install, first install the libffi package (required by cffi, a dependency of Twisted):

    sudo yum install libffi-devel libpython-dev libssl-dev

Or:

    sudo apt-get install libffi-dev

Then, install using pip:

    sudo pip install webmux

Or:

    git clone https://github.com/ronreiter/webmux.git
    cd webmux
    sudo python setup.py install

And then run webmuxd:

    webmuxd

You can then access webmux via:

    http://localhost:8080

Command line parameters
-----------------------

To run webmux on a different port, use the -p parameter. For example, to run webmux on port 8081, use:

    webmuxd -p 8081


Running webmux as a service
---------------------------

To run as a service, use your favorite service runner. For example, to use upstart, create
a file called *webmuxd.conf* in your /etc/init directory, that contains:

    description "webmuxd"

    start on runlevel [2345]
    stop on runlevel [016]

    respawn
    exec /usr/bin/webmuxd

TODOs
=====

* implement tabs properly
* remove references to focusedTerminal in favor of backbone triggered events, and fix focus issues
* support keyboard-interactive method (https://www.ietf.org/rfc/rfc4256.txt)
* several other terminal features described in Christopher's tty.js project
* make font size customizable
* support putty keys
* verify SSH host keys
* proper mouse support
* SCP file copy on drag & drop to home directory
* SCP file browser
* go over code and fix all TODOs
* convert connections dictionary into an ORM
* convert in-memory windows and terminals into an ORM, perhaps support restarts
* Add LDAP authentication
* "Don't remember me" in login

Contributors
============

webmux is based on code from Christopher Jeffrey's tty.js project:

https://github.com/chjj/tty.js


Troubleshooting
===============

Part of the dependencies require compiling code. On Macs, a recent change to the compiler made the following command
necessary when compiling packages with warnings in their code.

    sudo ARCHFLAGS="-Wno-error=unused-command-line-argument-hard-error-in-future" pip install webmux

License
=======

Copyright (c) 2014, Ron Reiter (MIT License)