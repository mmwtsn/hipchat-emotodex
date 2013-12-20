# Load Rubygems
require 'bundler'
Bundler.require

# Load helper file
require './helpers'

# Include helper methods
include Helpers

# Index
get '/' do
  erb :index
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

