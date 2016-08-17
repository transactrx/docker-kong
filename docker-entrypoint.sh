#!/bin/bash
set -e

# Setting up the proper database
if [ -n "$DATABASE" ]; then
  echo -e '\ndatabase: "'$DATABASE'"' >> /etc/kong/kong.yml
fi

# Setting up the proper database
if [ -n "$KONG_CONFIG" ]; then
  echo -e $DATABASE|base64 --decode > /etc/kong/kong.yml
fi

exec "$@"
