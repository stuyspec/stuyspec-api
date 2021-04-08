source 'https://rubygems.org'

ruby '2.7.0'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# Nicer IDs
gem 'friendly_id', '~> 5.1.0'

# For authentication
gem 'devise_token_auth', '~> 1.1.3' 

gem 'omniauth-google'

# Fixes CORS issues
gem 'rack-cors', :require => 'rack/cors'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.2.1'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.18'
# Use Puma as the app server
gem 'puma', '~> 3.12'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
# gem 'rack-cors'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec_junit_formatter'
  gem 'rspec-rails', '~> 3.5'
end

group :development do
  gem 'listen', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  gem "capistrano", "~> 3.12", require: false
  gem "capistrano-rails", "~> 1.4", require: false
  gem 'capistrano-rvm', require: false
  gem 'capistrano-passenger', require: false
  gem 'capistrano-bundler', '~> 1.6', require: false
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# Turns snake_case into camelCase
gem "olive_branch"
# OmniAuth
gem 'omniauth-github'

gem 'paperclip', '5.2.1'
gem 'aws-sdk'
gem 'airborne'
gem 'dotenv-rails', groups: [:development]
gem 'rack-throttle'

gem 'pg_search'
gem 'seed_dump'
gem 'graphql'
