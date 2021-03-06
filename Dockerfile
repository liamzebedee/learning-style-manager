# -*- sh -*-
FROM ubuntu

# Don't ask for confirm
ENV DEBIAN_FRONTEND noninteractive

# So we have add-apt-repository available
RUN apt-get -qy install software-properties-common python-software-properties

RUN add-apt-repository -y "deb http://archive.ubuntu.com/ubuntu precise main universe restricted multiverse"
RUN apt-get update

# development tools
RUN apt-get -qy install git nano

# ruby 1.9.3 and build dependencies
RUN apt-get -qy install ruby1.9.1 ruby1.9.1-dev build-essential libpq-dev libv8-dev libsqlite3-dev

# bundler
RUN gem install bundler

# create a "rails" user
# the Rails application will live in the /rails directory
RUN adduser --disabled-password --home=/rails --gecos "" rails

# copy the Rails app
# we assume we have cloned the "docrails" repository locally
# and it is clean; see the "prepare" script
ADD rails/ /rails

# copy and execute the setup script
# this will run bundler, setup the database, etc.
ADD docker_scripts/setup /setup
RUN apt-get -qy install rake
RUN su rails -c /setup

# copy the start script
ADD docker_scripts/start /start

EXPOSE 3000
USER rails
CMD /start
