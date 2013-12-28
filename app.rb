# Load Rubygems
require 'bundler'
Bundler.require

# Load and include helper methods
require './helpers'
include Helpers

configure do
  CACHE ||= Redis.new
  unless emoticons_in(CACHE)
    CACHE.update
  end
end

# Display Emoticons
get '/' do
  @emoticons = render_emoticons(CACHE)
  erb :index
end

# Update Emoticons
get '/refresh/?' do
  CACHE.update
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
