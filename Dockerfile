# Dockerfile

FROM phusion/passenger-ruby24:latest
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
ADD ./rails-env.conf /etc/nginx/main.d/rails-env.conf

# Add the nginx site and config
ADD ./stuyspec.conf /etc/nginx/sites-enabled/stuyspec.conf

# Add the Rails app
RUN mkdir /home/app/stuy-spec-api
WORKDIR /home/app/stuy-spec-api
ADD . /home/app/stuy-spec-api
RUN bundle install

RUN chown -R app:app /home/app

# Clean up APT and bundler when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
