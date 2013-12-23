require 'rack/test'
require 'webmock/rspec'
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
  c.before(:each) do
    stub_request(:get, "https://api.hipchat.com/v2/emoticon?auth_token=#{ENV['HIPCHAT_API']}").
    with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Host'=>'api.hipchat.com', 'User-Agent'=>'Ruby'}).
    to_return(:status => 200, :body => "stubbed response", :headers => {})
  end
end

# Prevent test suite from making external HTTP requests
WebMock.disable_net_connect!(allow_localhost: true)
