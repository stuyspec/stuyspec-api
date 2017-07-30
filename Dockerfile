# Dockerfile

FROM phusion/passenger-ruby22:0.9.17

# Set correct environment variables.
ENV HOME /root

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

# Expose Nginx HTTP service
EXPOSE 80

# Start Nginx / Passenger
RUN rm -f /etc/service/nginx/down

# Remove the default site
RUN rm /etc/nginx/sites-enabled/default

#Enable env vars
ADD ./app-env.conf /etc/nginx/main.d/app-env.conf

# Add the nginx site and config
ADD ./webapp.conf /etc/nginx/sites-enabled/stuyspec_webapp.conf

# Add the Rails app
RUN mkdir /home/deploy/stuy-spec-api
WORKDIR /home/deploy/stuy-spec-api
ADD . /home/app/stuy-spec-api
RUN bundle install --binstubs --deployment --without test development
RUN bundle exec rake assets:precompile

RUN chown -R deploy:deploy /home/deploy

# Clean up APT and bundler when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
