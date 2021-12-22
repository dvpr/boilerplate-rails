# boilerplate-rails
boilerplate for rails by docker and docker-compose

```
# enter container
docker-compose run rails bash
# install rails
gem install rails -v x.x.x
# new rails project
cd ~ && rails _rails_version_ new your_project_name
mv your_project_name/* /app
exit
# run it
docker-compose build
docker-compose up -d
browser at http://localhost:3000
```

