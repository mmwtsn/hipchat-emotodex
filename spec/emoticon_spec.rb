require_relative './spec_helper'

describe Helpers::HipChat do

  describe 'attributes' do
    it 'includes HTTParty' do
      Helpers::HipChat.should include(HTTParty)
    end

    it 'calls the correct endpoint' do
      Helpers::HipChat.base_uri.should eql 'https://api.hipchat.com/v2'
    end
  end

  describe 'GET emoticon' do
    let(:hipchat) { Helpers::HipChat.new }

    before do
      VCR.insert_cassette 'emoticon', :record => :new_episodes
    end
   
    after do
      VCR.eject_cassette
    end

    it 'when requested' do
      hipchat.get_emoticons.response.code.should eql "200"
    end
  end
end
