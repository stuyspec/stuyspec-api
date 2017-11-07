# Stuyvesant Spectator API

This is the official API for the Stuyvesant Spectator. Currently it is used as a backing service
for the Spectator website, but there are plans in the future to publish it as a public API.

The application is a Rails application, with a Postgres database. Everything is published as JSON
(in either camelCase or snake_case, using [Olive Branch](https://github.com/vigetlabs/olive_branch)). It is deployed on AWS using Elastic Beanstalk

## Setting Up
* Clone the repo (`git clone https://github.com/stuyspec/stuy-spec-api.git`)
* Install Ruby. We highly suggest rbenv or rvm
* Install Rails 5.1
* Install PostgreSQL (`brew install postgres` on Mac OS)
* Install Docker
* Run `docker-compose build`
* Run `docker-compose up`. If you get an error saying it can't connect to db, try stopping
and rerunning
* In a separate terminal instance, run `docker-compose run web rake db:create db:migrate db:seed`
