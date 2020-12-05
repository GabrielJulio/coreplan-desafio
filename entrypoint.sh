#!/bin/bash
set -e

# Remove possível server.pid pre-existente do Rails.
rm -f /myapp/tmp/pids/server.pid

# E depois executa o processo principal do container.
exec "$@"