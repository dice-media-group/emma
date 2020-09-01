# Emma

Emma is named after the first female telephone switchboard operator, hired September 1, 1878 (https://time.com/4011936/emma-nutt/). This rails app connects its blogger with its audience in a faster, more comfortable, more effective way.

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

#### Heroku Deploy
```
git push heroku master
```

#### Heroku Seed
```
heroku rake db:schema:load
heroku run rake db:migrate
heroku run rake db:seed
```

#### Heroku Database
```
heroku maintenance:on
heroku pg:reset DATABASE
heroku run rake db:migrate
heroku run rake db:seed
heroku maintenance:off
heroku restart
```

#### Heroku Server
```
heroku restart
```

#### Heroku Console
```
heroku run rails console
```

#### Heroku Logs
```
heroku logs -p web -t
heroku logs -p worker -t
```


