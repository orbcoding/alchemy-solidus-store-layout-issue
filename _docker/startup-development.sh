#!/bin/bash

# Remove a potentially pre-existing server.pid for Rails.
rm -f /src/tmp/pids/server.pid
# Remove any local gem override configs
rm -f /home/docker/.bundle/config

gems=/src/_gem_overrides
if [ "$(ls -A $gems)" ]; then
	for file in $gems/*; do
		filename="${file##*/}"
		bundle config local.${filename} $gems/${filename}
	done
fi

# Start the main process.
/home/docker/wait-for-it.sh db:5432 -- bundle exec rails s -p 3000 -b "0.0.0.0"
