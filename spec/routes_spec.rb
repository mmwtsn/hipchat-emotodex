require_relative './spec_helper'

describe 'This Sinatra application' do
  it 'should load the home page' do
    get '/'
    last_response.status.should == 200
  end

  it 'should not load undefined routes' do
    get '/sinatradoesntknowthisditty'
    last_response.status.should == 404
  end
end

