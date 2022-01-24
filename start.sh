#!/bin/bash

rails new -s /app

bundle install

bundle exec rake db:create
bundle exec rake db:migrate
bundle exec rake db:seed

if [ -f tmp/pids/server.pid ];then
    rm -f tmp/pids/server.pid
fi

rails server -b 0.0.0.0 -p 3000