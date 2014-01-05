# Application Helper Methods
require 'redis'
require 'json'

class GHButton
  attr_accessor :user, :repo
  def initialize(user, repo)
    @user = user
    @repo = repo
  end

  def style(type="follow", options={})
    # Available GitHub Button types
    types = ['fork', 'star', 'follow']

    # Ensure button type exists
    unless types.include? type
      raise ArgumentError, %Q(#{type} button not available. Try "fork", "star" or "follow")
    end

    # Work around bug in GitHub Button repository
    # Requesting "watch" actually returns "star"
    # See: https://github.com/mdo/github-buttons/issues/42#issuecomment-19951052
    if type == 'star'
      type = 'watch'
    end

    # Ensure argument type is valid
    unless type.is_a? String
      raise ArgumentError, "Expected String, got #{type.class}"
    end

    # If no options are specified, pass none
    if options.empty?
      large = count = nil
    end

    # Format options as URL query parameters for final iFrame
    if options[:large] then size = "&size=large" end
    if options[:count] then count = "&count=true" end

    # Return GitHub Button
    %Q(<iframe src="http://ghbtns.com/github-btn.html?user=#{@user}&repo=#{@repo}&type=#{type}#{size}#{count}" allowtransparency="true" frameborder="0" scrolling="0" width="250" height="30"></iframe>)
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
      
      # style GET request to 'emoticon' endpoint of HipChat API v2.0
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
