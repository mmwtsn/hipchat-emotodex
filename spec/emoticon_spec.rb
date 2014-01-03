require_relative './spec_helper'

describe HipChat do
  it 'includes HTTParty' do
    HipChat.should include(HTTParty)
  end

  it 'calls the correct endpoint' do
    HipChat.base_uri.should eql 'https://api.hipchat.com/v2'
  end
end

describe Helpers, '#new_query' do
  before(:all) do
    @query = new_query
  end

  it 'should return a String' do
    @query.class.should eql String
  end

  it 'should be parseable by JSON' do
    parsed_string = JSON.parse @query
    parsed_string.class.should eql Hash
  end
end
