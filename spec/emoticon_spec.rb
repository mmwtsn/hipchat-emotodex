require_relative './spec_helper'

describe HipChat do
  it 'includes HTTParty' do
    HipChat.should include(HTTParty)
  end

  it 'calls the correct endpoint' do
    HipChat.base_uri.should eql 'https://api.hipchat.com/v2'
  end
end

describe GHButton do
  before(:all) do
    @button = GHButton.new('a-user', 'a-repository')
  end

  describe '#initialize' do
    it 'gets the user name' do
      @button.user.should eql 'a-user'
    end

    it 'gets the repository name' do
      @button.repo.should eql 'a-repository'
    end
  end

  describe '#build' do
    it 'returns a correct string' do
      @button.build.class.should eql String
    end

    it 'returns the correct string' do
      @button.build.should eql %Q{<iframe src="http://ghbtns.com/github-btn.html?user=a-user&repo=a-repository&type=follow&size=large" allowtransparency="true" frameborder="0" scrolling="0" width="250" height="30"></iframe>}
    end

    it 'contains the user name' do
      @button.build.match(%r(a-user)).should be_true
    end

    it 'contains the repo name' do
      @button.build.match(%r(a-repository)).should be_true
    end

    it 'accepts "watch"' do
      @button.build("watch").match(%r(watch)).should be_true
    end

    it 'accepts "fork"' do
      @button.build("fork").match(%r(fork)).should be_true
    end

    it 'accepts "follow"' do
      @button.build("follow").match(%r(follow)).should be_true
    end

    it 'does not accept an Integer' do
      expect{@button.build(12)}.to raise_error(ArgumentError)
    end

    it 'does not accept a non-standard String' do
      b = GHButton.new('mmwtsn', 'hipchat-emotodex')
      expect{@button.build('bananas')}.to raise_error(ArgumentError)
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
