#!/bin/bash
set -e

CONF_INI=/etc/letsencrypt.ini

if [ ! -f $CONF_INI ]; then
    echo "$CONF_INI unfindable, that's not a standard situation"
    exec $@
else
    [ "$EMAIL" != "" ] && sed -i -r "s/^\#?email\ =.*$/email = ${EMAIL}/" $CONF_INI

    if [ "$1" == 'certbot' -a -f $CONF_INI ]; then
        shift
        exec certbot -i $CONF_INI --agree-tos $@
    else
        exec $@
    fi
fi

