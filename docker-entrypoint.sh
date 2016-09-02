#!/usr/local/bin/dumb-init /bin/bash
set -e

# Disabling nginx daemon mode
export KONG_NGINX_DAEMON="off"

[ -z "$KONG_NGINX_DAEMON" ] && export KONG_NGINX_DAEMON="off"

# Setting up the proper database
if [ -n "$KONG_CONFIG" ]; then
  echo -e $KONG_CONFIG|base64 --decode > /etc/kong/kong.yml

  echo "using this configuration:"
  cat  /etc/kong/kong.yml
fi

exec "$@"
