#!/bin/bash
set -e

[ "$EMAIL" != "" ] && sed -i -r "s/^\#?email\ =.*$/email = ${EMAIL}/" /etc/letsencrypt/cli.ini
exec $@

