Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports.
  config.consider_all_requests_local = true

  # Enable/disable caching. By default caching is disabled.
  if Rails.root.join('tmp/caching-dev.txt').exist?
    config.action_controller.perform_caching = true

    config.cache_store = :memory_store
    config.public_file_server.headers = {
      'Cache-Control' => "public, max-age=#{2.days.seconds.to_i}"
    }
  else
    config.action_controller.perform_caching = false

    config.cache_store = :null_store
  end

  config.action_mailer.raise_delivery_errors = true

  config.action_mailer.perform_caching = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

 # config.action_mailer.default_url_options = {
 #    :host => 'localhost:3000'
 #  }
 #  config.action_mailer.delivery_method = :smtp
 #  config.action_mailer.smtp_settings = {
 #    :address => "localhost", :port => 1025
 #  }
 
  config.action_mailer.default_url_options = { :host => 'localhost:3000'}
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {:address => "localhost", :port => 1025}
  config.paperclip_defaults = {
    :storage => :s3,
    :s3_region => "us-east-1",
    :url => ":s3_domain_url",
    :s3_endpoint => 's3-us-east-1.amazonaws.com',
    :s3_protocol => "https",

    # A DEV_PAPERCLIP_BUCKET variable can be used to specify the production 
    # image bucket (stuyspec-images). This is useful for getting the correct
    # URLs on images dumped from prod DB.
    :bucket => ENV['DEV_PAPERCLIP_BUCKET'].presence || 'stuyspec-media-testing',
  }
  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true

  # Use an evented file watcher to asynchronously detect changes in source code,
  # routes, locales, etc. This feature depends on the listen gem.
  config.file_watcher = ActiveSupport::EventedFileUpdateChecker

  # For local subdomain support
  config.action_dispatch.tld_length = 0
end

Paperclip.options[:command_path] = "/usr/local/bin/"
