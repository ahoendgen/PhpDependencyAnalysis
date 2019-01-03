#!/bin/sh

composer install --no-dev
~/.composer/vendor/bin/box build -vv
mv ./download/phpda.phar ./download/phpda
mv ./download/phpda.phar.pubkey ./download/phpda.pubkey
sha1sum ./download/phpda > ./download/phpda.version
chmod +x ./download/phpda
