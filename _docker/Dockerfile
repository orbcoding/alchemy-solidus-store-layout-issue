FROM ruby:3.2.2-alpine

RUN apk add --update --no-cache \
	# Needed for nokogiri
	build-base \
	# Needed for installing gems from git
	git \
	# Needed for correct dates
	tzdata \
	# Needed for installing gem pg
  postgresql-dev \
	# Needed for pg interaction
	postgresql-client \
	nodejs \
	yarn \
	bash \
	vim \
	# Image optimizer
	imagemagick \
	pngquant \
	optipng \
	jpegoptim
	

RUN mkdir /src

# Capybara chrome webdriver
# RUN if [[ "$ORB_BUILD_ENV" == "development" ]]; then \
# 	echo "building $ORB_BUILD_ENV"; \
# 	apk add --no-cache chromium chromium-chromedriver python3 python3-dev py3-pip; \
# 	pip3 install -U selenium; \
# fi


# If using much larger non-alpine parent
# FROM ruby:2.5
# RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
# RUN apt-get update -qq && apt-get install -y nodejs postgresql-client vim yarn pngquant optipng jpegoptim
# RUN mkdir /src /home/docker
