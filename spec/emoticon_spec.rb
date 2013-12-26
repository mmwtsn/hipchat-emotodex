require_relative './spec_helper'

describe HipChat do
  it 'includes HTTParty' do
    HipChat.should include(HTTParty)
  end

  it 'calls the correct endpoint' do
    HipChat.base_uri.should eql 'https://api.hipchat.com/v2'
  end
end
