require_relative './spec_helper'

describe 'This Sinatra application' do
  it 'should load the home page' do
    get '/'
    last_response.status.should eql 200
  end

  it 'should not error out' do
    get '/'
    last_response.status.should_not eql 500
  end

  it 'should not load undefined routes' do
    get '/sinatradoesntknowthisditty'
    last_response.status.should eql 404
  end
end
