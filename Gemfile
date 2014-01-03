source 'https://rubygems.org'

# Specify Ruby version for Heroku
ruby '2.0.0'

# Gems for all environments
gem 'sinatra'
gem 'httparty'
gem 'redis'
gem 'thin'

group :development, :test do
  # middleware
  gem 'rack'
  gem 'rack-test', :require => 'rack/test'

  # Ruby unit test library
  gem 'rspec'

  # Ruby task runner
  gem 'rb-fsevent'
  gem 'guard-rspec'
  gem 'guard-compass'
  gem 'guard-livereload'
end
