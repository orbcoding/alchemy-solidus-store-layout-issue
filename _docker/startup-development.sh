#!/bin/bash

# Remove a potentially pre-existing server.pid for Rails.
rm -f /src/tmp/pids/server.pid
# Remove any local gem override configs
rm -f /home/docker/.bundle/config

# Start the main process.
/home/docker/wait-for-it.sh db:5432 -- bundle exec rails s -p 3000 -b "0.0.0.0"
