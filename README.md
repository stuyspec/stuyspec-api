<img src="https://imgur.com/aPbzogH.png"/>
<br/>

# Stuyvesant Spectator API
This is the official API for the Stuyvesant Spectator. Currently it is used as a backing service
for the Spectator website, but there are plans in the future to publish it as a public API.

## Setting Up
1. Clone the repo
```
$ git clone https://github.com/stuyspec/stuy-spec-api.git`)
```
2. Follow the directions below to set up Rails. Ignore the MySQL section; instead, only complete the PostgreSQL section: https://gorails.com/setup/
3. In the `stuy-spec-api` repository, create your [dotenv](https://github.com/bkeepers/dotenv) file.
```
$ echo PG_HOST:localhost > .env
```
4. Create, migrate, and seed the database.
```
$ rails db:create db:migrate db;seed
```

### AWS
If you are using our `cli-uploader`, you need to be able to POST media files. You will need to be an IAM user for the Spectator Web AWS account. Request an account by e-mailling [stuyspecweb@gmail.com](mailto:stuyspecweb@gmail.com) or by messaging one of the editors on Facebook.

Once you have an IAM account, go to the AWS console and navigate to the service "IAM". Go to _Users_, in the sidebar, and click on your username. Click the _Security Credentials_ tab and create an Access Key. It will prompt you to download a file with your new access key and secret key. Download it.

Create a file in `stuy-spec-api/config` called `aws.yml` and set up your file like so:
```
development:
  access_key_id: YOUR_ACCESS_KEY_ID
  secret_access_key: YOUR_SECRET_ACCESS_KEY
  bucket: stuyspec-media-testing

production:
  access_key_id: YOUR_ACCESS_KEY_ID
  secret_access_key: YOUR_SECRET_ACCESS_KEY
  bucket: stuyspec-media
```
<!--



![alt text](https://i.imgur.com/uti8BnI.png))
# Docker

## Setting Up
1. Clone the repo (`git clone https://github.com/stuyspec/stuy-spec-api.git`)
2. Install Ruby. We highly suggest rbenv or rvm
3. Install Rails 5.1
4. Install PostgreSQL (`brew install postgres` on Mac OS)
5. Install Docker
6. Create a file with name `.env` in the repository and write in it: `PG_HOST-db`. Run `docker-compose build`
7. Run `docker-compose up`. If you get an error saying it can't connect to db, try stopping
and rerunning.
8. In a separate terminal instance, run `docker-compose run web rake db:create`. If there are a bunch of errors about being unable to connect to TCP/IP at 5432, just check the top of those errors to see if something like `Created database stuy-spec-api_development` was created. If so, then ignore the errors.
9. Run `docker-compose run web rails db:migrate db:seed`
10. To start the server, run `docker-compose run web rails server`.


## Troubleshooting

### Server exited at `docker-compose up`
Check the last few lines of the server log in your shell.
1. A server is already running.
```
web_1  | A server is already running. Check /stuy-spec-api/tmp/pids/server.pid.
web_1  | => Booting Puma
web_1  | => Rails 5.1.2 application starting in development on http://0.0.0.0:3000
web_1  | => Run `rails server -h` for more startup options
web_1  | Exiting
stuyspecapi_web_1 exited with code 1
```
To solve this problem, we need to remove the `server.pid` file. Navigate to the stuy-spec-api directory and run:
```
rm tmp/pids/server.pid
```

### Connection refused at `docker-compose run web ...`
```
could not connect to server: Connection refused
	Is the server running on host "localhost" (127.0.0.1) and accepting
	TCP/IP connections on port 5432?
```
You might have a server already running that has not shut down correctly. Run `brew services stop postgresql`

In general, if you run into this error, the command may have already worked. Look at the top of the error. If you tried to run `docker-compose run web rails db:create` and, on top of the Connection refusal, it says "Created database...", the command worked. It may have interrupted the `db:migrate`, so run `docker-compose run web rails db:migrate` as an individual function separated from the `db:create`.

If that is not the case, run `postgres -D /usr/local/var/postgres`. You may see something like this:
```
FATAL:  lock file "postmaster.pid" already exists
HINT:  Is another postmaster (PID 15556) running in data directory "/usr/local/var/postgres"?
```
Run `kill -9 THE_PID`, and you should be good to go.

### Database drop/reset fails
```
Couldn't drop database 'stuy-spec-api_development'
rails aborted!
ActiveRecord::StatementInvalid: PG::ObjectInUse: ERROR:  database "stuy-spec-api_development" is being accessed by other users
DETAIL:  There are {SOME_NUMBER} other sessions using the database.
```
There is a rake task for deleting these sessions in `lib/tasks/kill_postgres_connections.rake`. To run the task, do
```sh
docker-compose run web rake kill_postgres_connections
```
This should kill related postgres connections, and database drop/reset should now work.

If dropping the database still does not work, use the initializer at `config/initializers/postgresql_database_tasks.rb` by adding an environment option to the rake task like so:
```sh
docker-compose run web rake environment db:drop
```

### Cannot `bundle install`
If you need to add gems and the `bundle install` is [repetitively failing](https://stackoverflow.com/questions/6971290/running-bundle-install-fails-and-asks-me-to-run-bundle-install), you need to rebuild your Docker image to update the `Gemfile.lock`.
```
$ docker run web bundle install
$ docker build
```
-->
