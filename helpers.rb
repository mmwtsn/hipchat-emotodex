# Application Helper Methods
require 'redis'
require 'json'

class GHButton
  attr_accessor :user, :repo
  def initialize(user, repo)
    @user   = user
    @repo   = repo
  end

  def build(action="star")
    # Available GitHub Button types
    actions = ['star', 'fork', 'follow']

    # Ensure button type exists
    unless actions.include? action
      raise ArgumentError, 'GitHub Button not available with specified action'
    end

    # Ensure argument type is valid
    unless action.is_a? String
      raise ArgumentError, "Expected String, got #{action.class}"
    end

    # Return GitHub Button
    "<iframe src=\"#{@user}\" class=\"#{action}\">#{@repo}</iframe>"
  end
end

module Helpers

  # HipChat API Helpers
  class HipChat
    include HTTParty
    base_uri 'https://api.hipchat.com/v2'

    def get_emoticons
      # Ensure API key is set and available before proceeding
      unless ENV['HIPCHAT_API']
        raise 'HipChat API key not accessible under "HIPCHAT_API" key. See README.'
      end
      
      # Build GET request to 'emoticon' endpoint of HipChat API v2.0
      self.class.get '/emoticon', query: { 'auth_token' => ENV['HIPCHAT_API'], 'type' => 'group' }
    end
  end

  # Refresh cache with new GET request to HipChat
  def update(cache)
    cache.set('emoticons', new_query)
  end

  # GET emoticons from HipChat API and return the response body
  def new_query
    hipchat = HipChat.new.get_emoticons

    # Proceed only if GET request is successful
    if hipchat.response.code != 200.to_s
      raise "Unable to successfully query the HipChat API. Error code: #{hipchat.response.code}"
    end

    # Return body of GET request from HipChat
    emoticons = hipchat.response.body
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
