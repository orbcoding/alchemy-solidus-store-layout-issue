alias development="/src/_docker/startup-development.sh"
alias staging="/src/_docker/startup-staging.sh"
alias production="/src/_docker/startup-production.sh"
alias webpack="/src/bin/webpack-dev-server"
alias precompile="rake assets:clobber assets:precompile"
alias reloadrails="bundle exec pumactl phased-restart"
alias serve='bundle exec rails s -p 3000 -b "0.0.0.0"'
alias compile="rake webpacker:compile"
alias rails='bundle exec rails'
alias rake='bundle exec rake'
alias rspec='bundle exec rspec'

