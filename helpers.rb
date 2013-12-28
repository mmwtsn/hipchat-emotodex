# Application Helper Methods
require 'redis'
require 'json'

module Helpers

  # HipChat API Helpers
  class HipChat
    include HTTParty
    base_uri 'https://api.hipchat.com/v2'

    def get_emoticons
      self.class.get '/emoticon', query: { 'auth_token' => ENV['HIPCHAT_API'], 'type' => 'group' }
    end
  end

  # Redis Monkey Patch
  class Redis
    def initialize 
      @cache = Redis.new
      @cache.flushall
    end

    # Refresh cache with new GET request to HipChat
    def update
      @cache.set('emoticons', new_query)
    end
  end

  # GET emoticons from HipChat API and return the response body
  def new_query
    hipchat = HipChat.new
    emoticons = hipchat.get_emoticons.response.body
  end

  # Check if 'emoticons' key exists in Redis cache
  def emoticons_in(cache)
    cache.exists('emoticons')
  end

  # Call 'emoticons' JSON string from cache, parse and return hash of emoticons
  def render_emoticons(cache)
    string = cache.get('emoticons')
    hash = JSON.parse(string)
    emoticons = hash['items']
  end
end
