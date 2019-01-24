# Poem Share

Share a Poem with a single link which will never expire! Check out [this one][1]!

[1]: https://poem-share.herokuapp.com/poem/RFJFQU0NCg0KSXQgd2FzIGEgZHJlYW0gSSBuZXZlciBoYWQ7DQpJdCB3YXMgYSBkYXJrIGdyaW0gZGVhdGggYWhlYWQsDQpBIGJpdCBvZiBjb2xvcnMsIG5pY2UgYW5kIGJsb29tLA0KSSB3YWtlIHVwIHN3ZWF0aW5nLCBhZnRlcm5vb24u

## How does it work?

The text of a poem is encoded into url safe base64 encoding and later
used to retrieve the same poem and put it into a beautiful layout to
share.

## Prerequisites

- Ruby v2.5+
- NodeJS (or any kind of other environment for running JavaScript inside Ruby)

## How to use

Development:

``` shell
$ git clone https://github.com/greenfork/poem-share.git
$ cd poem-share
$ bin/bundle install --without production
$ bin/yarn install
$ bin/rails spec
$ bin/rails server
```

Production for heroku:

- Set `YARN_PRODUCTION` variable to `false`
- Choose heroku/nodejs buildpack as #1
- Choose heroku/ruby buildpack as #2
- Push

Production, untested:

``` shell
$ export LANG=en_US.UTF-8
$ export RAILS_ENV=production
$ export RACK_ENV=production
$ export DATABASE_URL=postgres://path/to/database
$ export RAILS_SERVE_STATIC_FILES=true # if there's no nginx or etc.
$ export SECRET_KEY_BASE=your_secret
$ git clone https://github.com/greenfork/poem-share.git
$ cd poem-share
$ bin/yarn install
$ bin/bundle install --without development:test --path vendor/bundle --binstubs vendor/bundle/bin --deployment
$ bin/rake assets:precompile
$ bin/bundle exec puma -C config/puma.rb
```

## License

Copyright © 2019 Dmitriy Matveyev

Distributed under the MIT license, see LICENSE file.
