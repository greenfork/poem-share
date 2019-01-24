# Poem Share

Share a Poem with a single link which will never expire!

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

## License

Copyright © 2019 Dmitriy Matveyev

Distributed under the MIT license, see LICENSE file.
