# Application Helper Methods
module Helpers

  class HipChat
    include HTTParty
    base_uri 'https://api.hipchat.com/v2'

    def get_emoticons
      self.class.get '/emoticon', query: { 'auth_token' => ENV['HIPCHAT_API']}
    end
  end

  def all_emoticons
    hipchat = HipChat.new
    emoticons = hipchat.get_emoticons['items']
  end
end
