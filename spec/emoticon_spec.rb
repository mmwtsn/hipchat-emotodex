require_relative './spec_helper'

describe HipChat do
  it 'includes HTTParty' do
    HipChat.should include(HTTParty)
  end

  it 'calls the correct endpoint' do
    HipChat.base_uri.should eql 'https://api.hipchat.com/v2'
  end
end

describe Redis do
  before(:all) do
    @cache = Redis.new
  end

  describe '#set, #get' do
    it 'should return set values' do
      @cache.set('foo', 'bar')
      @cache.get('foo').should eql 'bar'
    end

    it 'should reset values' do
      @cache.set('foo', 'bash')
      @cache.get('foo').should_not eql 'bar'
    end
  end

  describe Helpers do
    describe '#emoticons_in' do
      it 'should check the cache for emoticons' do
        emoticons_in(@cache).should eql true
      end
    end

    describe '#render_emoticons' do
      it 'should return a Hash' do
        render_emoticons(@cache).class.should eql Array
      end
    end
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
