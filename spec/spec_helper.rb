require 'rack/test'
require 'webmock'
require 'vcr'
require_relative '../app.rb'

set :environment, :test

module RSpecHelper
  def app
    Sinatra::Application
  end
end

RSpec.configure do |c|
  c.include Rack::Test::Methods
  c.include RSpecHelper
end

VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures/dish_cassettes'
  c.hook_into :webmock
end
