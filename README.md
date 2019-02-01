# CTF dojo #

This is a set of minimal CTF challenges in various categories with a tiny challenge deployment platform and leaderboard system. The platform is by no means ideal, potentially not secure, etc etc – **use at your own risk**!

## Dependencies ##

 - [`haxe`](https://haxe.org/)
 - [`node`](https://nodejs.org/), [`npm`](https://www.npmjs.com/)
 - `sox` (for playing sounds)

For development:

 - [`sass`](https://sass-lang.com/)

Some challenge categories have additional dependencies (at runtime):

 - PHP
   - a `php` binary
 - SQLi
   - a MySQL server with a root account (able to create users, databases, and grant privileges)

## Building ##

After the necessary dependencies are installed, clone the repository and install the `npm` and `haxelib` dependencies:

    $ git clone https://github.com/EmpireCTF/dojo
    $ cd dojo
    $ cd src
    $ haxelib install hxnodejs
    $ haxelib install hxsocketio
    $ cd ../bin
    $ npm install

A configuration file will need to be created. The configuration file is a Haxe source file. The template, `Config.template.hx`, should be duplicated as `src/Config.hx`, then follow the instructions in the comments.

    $ cp Config.template.hx src/Config.hx
    $ vim src/Config.hx # or nano, vi, open, etc

The platform can then be compiled (this produces / updates `build/server.js`):

    $ cd src
    $ haxe make.hxml

## Running ##

To start the platform:

    $ cd bin
    $ node server.js

## Project structure ##

The platform is a Haxe project compiled to a Node.js script. At compile time, various challenge categories are defined along with the challenges themselves. These can then be set up / torn down on demand as necessary. 

Setup and teardown varies per challenge category:

 - PHP
   - setup: a temporary directory is created, and `php` runs with `open_basedir` limited to that temporary directory
   - teardown: the temporary directory is deleted
 - SQLi
   - setup: a new user is created, granted access only to a single, new database, which is pre-filled with the necessary schema and data
   - teardown: the user and the database are deleted

When a challenge is running, an Express.js HTTP server is also launched, allowing users to see the challenge and try to solve it. Any submission is checked and if the correct flag is detected, the user is added to the leaderboard.

Directory structure:

 - `bin/` - directory containing the built script and runtime assets
   - `assets/` - assets accessible to the users via HTTP directly
   - `sfx/` - sounds playable by the platform
   - `templates/` - HTML templates for various challenges
   - `server.js` - the built platform script
 - `src/` - source code files
   - `chal/` - Haxe classes for defining challenges
     - `js/`, `php/`, `sqli/` - categories

## TODO ##

 - better host security
   - Dockerfile / Vagrantfile
   - PHP using an actual PHP server
 - forward via remote server
 - prebuilt (Haxe-less) release
 - control panel
   - hint system
 - persistent leaderboard
