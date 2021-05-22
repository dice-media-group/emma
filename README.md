# Emma

Emma is named after the first female telephone switchboard operator, hired September 1, 1878 (https://time.com/4011936/emma-nutt/). This rails app connects its blogger with its audience in a faster, more comfortable, more effective way.

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

- Ruby version 2.7

- System dependencies

  - redis
  - ngrok for development and testing
  - sidekiq

- Configuration

  - A .env file needs to written. An example is provided, dot-env.example
  - The Procfile.dev tells the command `foreman start` how to launch supporting services

- Database creation

- Database initialization

- How to run the test suite

- Services (job queues, cache servers, search engines, etc.)

- Deployment instructions

- ...

#### Heroku Deploy

```
git push heroku master

heroku config:set APPLICATION_HOST='www.mydomain.com' AWS_ACCESS_KEY_ID=AWS1ACCESS1KEY AWS_SECRET_ACCESS_KEY=AWS1SECRET1ACCESS1KEY GOOGLE_ANALYTICS_ID=G-MY1KEY S3_BUCKET=assets.mydomain.com S3_REGION=us-east-1 SEGMENT_ID=MY1SEGMENT_ID SENDGRID_API_KEY=SG.MYSENDGRIDID.3CsncCfDvQjpxOvHdnAkUYl-Af4M85p9XBis5XB3KfQ -r production

** go into the dashboard and turn on the sidekiq worker under resources

heroku run rake db:migrate

heroku run rake db:seed

heroku addons:create heroku-redis:hobby-dev


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
