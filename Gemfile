source 'https://rubygems.org'

# Specify Ruby version for Heroku
ruby '2.0.0'

# Gems for all environments
gem 'sinatra'
gem 'httparty'
gem 'redis'

group :development, :test do
  # local server
  gem 'thin'

  # middleware
  gem 'rack'
  gem 'rack-test', :require => 'rack/test'

  # Ruby unit test library
  gem 'rspec'

  # JavScript unit test lirbrary
  gem 'jasmine'

  # Ruby task runner
  gem 'rb-fsevent'
  gem 'guard-rspec'
  gem 'guard-compass'
  gem 'guard-livereload'
end
