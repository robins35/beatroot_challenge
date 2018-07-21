# Beatroot API Challenge

This is the result of a technical screen I did for a potential employer. It is
a rails app that hits the beatroot api and displays a list of tracks to the
user. The user can then either download the xml representation of the data, or
view the xml in the browser. This requires an additional GET request to the api
for a specific track (by :id).

### Stack used

* Ruby version: 2.5.1

* Rails version: 5.2.0

* System dependencies:

  - No database is used, however I spun up a new rails app that automatically
    used sqlite3 (which I already had the dev packages for on my Debian
    machine). In case you need it, the command for getting that on debian-based
    linux distros is: `sudo apt-get install libsqlite3-dev`.

* Configuration:
  - After having ruby 2.5.1, bundler, and sqlite3, you should only have to run `bundle`.

  - This app will not work whatsoever without my master.key. This is because I
  store various encrypted API credentials/info in the credentials.yml.enc. Without the
  master.key file, you won't be able to become authorized with the api.
  Save/move my master.key to: `config/master.key`, everything should work after
  doing that. If you want to view the encrypted credentials, put the master.key
  in place and run `EDITOR=vim rails credentials:edit`.

* How to run the test suite: `rspec`

* Run server with: `rails s`

* Deployment instructions: I only used this locally so that is up to you. There
  is nothing unusual about this app that would require any special work though.
  Pushing it to a heroku instance *should* work out of box.
