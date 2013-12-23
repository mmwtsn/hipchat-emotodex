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

  describe '.get_emoticons' do
    it 'makes a successful GET request' do
      hipchat = Helpers::HipChat.new
      hipchat.get_emoticons.response.code.should eql "200"
    end
  end
end

describe 'Helpers.all_emoticons' do
  it 'returns a hash' do
    all_emoticons.class.should eql String
  end
end

describe 'Emoticon external request' do
  it 'queries the HipChat API' do
    uri = URI("https://api.hipchat.com/v2#{ENV['HIPCHAT_API']}")

    response = Net::HTTP.get(uri)

    expect(response).to be_an_instance_of(String)
  end
end
