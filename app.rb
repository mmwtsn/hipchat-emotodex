# Load Rubygems
require 'bundler'
Bundler.require

# Load and include helper methods
require './helpers'
include Helpers

configure do
  # If cache is not set, create new Redis instance
  uri = URI.parse(ENV["REDISTOGO_URL"]) # Required for Heroku
  CACHE ||= Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)

  # Ensure value exists in cache before proceeding
  unless emoticons_in(CACHE)
    update(CACHE)
  end
end

# Display Emoticons
get '/' do
  # Format emoticon data and make them available to the view
  @emoticons = render_emoticons(CACHE)
  erb :index
end

# Update Emoticons
get '/refresh/?' do
  update(CACHE)
  redirect '/'
end

# 404
not_found do
  status 404
  erb 404.to_s.to_sym
end

# 500
error do
  status 500
  erb 500.to_s.to_sym
end
