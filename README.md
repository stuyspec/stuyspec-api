<img src="https://imgur.com/aPbzogH.png"/>

# Stuyvesant Spectator API

The official API for the Stuyvesant Spectator.

## Setting Up

1. Clone the repo
```
$ git clone https://github.com/stuyspec/stuy-spec-api.git
```

2. Follow the directions below to set up Rails. Ignore the MySQL section; instead, only complete the PostgreSQL section: https://gorails.com/setup/

3. On linux, go to /etc/postgresql/YOUR_VERSION/main/pg_hba.conf. At the bottom, change the method to trust for all lines that start with local all or host all. Then, run `sudo systemctl restart postgresql`

4. In the `stuy-spec-api` repository, create your [dotenv](https://github.com/bkeepers/dotenv) file.
```
$ echo PG_HOST=localhost > .env
```

5. If you intend to use this API while working with client-app or cli-uploader, follow the setup instructions in the [AWS S3](#setting-up-s3) section below. Then create, migrate, and seed the database with media.
```
$ rails db:create db:migrate db:seed media=true
```

6. If you did not follow instruction 4, create, migrate, and seed the database.
```
$ rails db:create db:migrate db:seed
```

7. To start the server, run:
```
rails server
```

## Docker

If the above doesn't work, you can use Docker. Docker encapsulates your runtime environment into
a "container", basically making your configuration deterministic and reproducible.

1. Follow steps 1-3 above

2. Run `docker-compose build`

3. Run `docker-compose up`. If you get an error saying it can't
connect to db, try stopping and rerunning.

4. In a separate terminal instance, run `docker-compose run web rake db:create`. If there are a bunch of errors about being unable to connect to TCP/IP at 5432, just check the top of those errors to see if something like `Created database stuy-spec-api_development` was created. If so, then ignore the errors.

5. Run `docker-compose run web rails db:migrate db:seed`

6. To start the server, run `docker-compose run web rails server`.

## AWS

You will need to be an IAM user for the Spectator Web AWS account. Request an account by messaging one of the editors on Facebook.

While you wait for your beloved editors to get the account set up, watch this [IAM introduction](https://www.youtube.com/watch?v=Ul6FW4UANGc).

After you receive your login information, navigate to the [stuyspec AWS console](https://stuyspec.signin.aws.amazon.com/console) and log in. In the AWS console, navigate to the service "IAM". Go to _Users_, in the sidebar, and click on your username. Click the _Security Credentials_ tab and create an Access Key. It will prompt you to download a file with your new access key and secret key. Download it.

If you don't have one already, navigate to your home directory (`cd ~/`) and make a directory called `.aws`. Then create a file called `config` with this content:

```
[default]
region=us-east-2
output=json
```

Next, create a file called `credentials` with this content:

```
[default]
aws_access_key_id=YOUR_ACCESS_KEY_ID
aws_secret_access=YOUR_SECRET_ACCESS
```

### Setting up S3

Once the `~/.aws` directory is set up above, S3 should work automagically.

### Using Elastic Beanstalk

Elastic Beanstalk is an orchestration service offered from Amazon Web Services for deploying infrastructure which orchestrates various AWS services, including EC2 (a cloud computing service) and S3. It is where we host our production database.

#### `rails console` 

The [Rails console](http://guides.rubyonrails.org/command_line.html#rails-console) lets you interact with the Rails API from the command line with Ruby. For instance:

```
> a = Article.find_by(title: 'The Original Title')
> a.title = 'New Title'
> a.save
```

This function is helpful if you know cli-uploader made a mistake or you want to make a small change in a record of the database. Here are the steps to open the Rails console for our production database:

1. Install the Elastic Beanstalk CLI: ([Mac](https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/eb-cli3-install-osx.html), [Linux](https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/eb-cli3-install-linux.html), [Windows](https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/eb-cli3-install-windows.html)).

2. Run `eb init`. Select the default region as choice 1 (us-east-1). Select the default application as choice 1 (stuyspec-api-prod). **DO NOT** create a new application and **DO NOT** create a new environment.

3. You'll need an SSH key to be able to SSH. This comes in the form of a `.pem` key file that you put into your home ssh directory (`~/.ssh`). Download the `.pem` key (either from Jason Kao or Nicholas Yang) and place it into the aforementioned directory. **NEVER** share this file publically.

4. `eb ssh` and connect to our EB instance.

5. Navigate to the directory of the Rails API (`cd /var/app/current`).

6. Here, you can run `rails console` and manipulate the database.

To exit the Rails console, use `Ctrl-D`. To exit the SSH, use `Ctrl-D` as well.

#### Deploying `stuy-spec-api`

1. Go to your local `stuy-spec-api` directory and check out and pull down the branch you want to deploy.

2. Run `eb init`. Select the default region as choice 1 (us-east-1). Select the default application as choice 1 (stuyspec-api-prod). **DO NOT** create a new application and **DO NOT** create a new environment.

3. Run `eb deploy`.

## Testing GraphQL

Use [GraphiQL](https://github.com/graphql/graphiql) to test your GraphQL queries.

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
