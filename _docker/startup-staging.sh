#!/bin/bash

# Remove a potentially pre-existing server.pid for Rails.
rm -f /src/tmp/pids/server.pid
# Remove any local gem override configs
rm -f /home/docker/.bundle/config

# Compile the assets
# bundle exec rake assets:precompile

# Start the main process.
/home/docker/wait-for-it.sh alchemy-solidus-store-layout-issue_staging_db:5432 -- bundle exec rails s
