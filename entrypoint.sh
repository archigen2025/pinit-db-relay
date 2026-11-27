#!/bin/sh
# Writes a chisel authfile from RELAY_AUTH ("user:pass") that only allows the Supabase pooler on 5432/6543,
# then starts the server. AUTH is unset so chisel never falls back to a full-access user.
set -eu
: "${RELAY_AUTH:?RELAY_AUTH (user:pass) is required}"
umask 077
printf '{"%s": ["^aws-1-ap-northeast-2\\\\.pooler\\\\.supabase\\\\.com:(5432|6543)$"]}\n' "$RELAY_AUTH" > /tmp/users.json
unset RELAY_AUTH AUTH
exec /usr/local/bin/chisel server --authfile /tmp/users.json --keepalive 25s
