require 'rack/test'
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

