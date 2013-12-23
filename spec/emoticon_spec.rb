require_relative './spec_helper'

describe 'Helpers::HipChat' do
  describe 'attributes' do
    it 'includes HTTParty' do
      Helpers::HipChat.should include(HTTParty)
    end

    it 'calls the correct endpoint' do
      Helpers::HipChat.base_uri.should eql 'https://api.hipchat.com/v2'
    end
  end
end
