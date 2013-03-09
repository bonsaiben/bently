module Bently
  class Twitter < RailsRecipe

    title 'twitter'
    homepage 'https://github.com/sferik/twitter/blob/master/README.md'

    def initialize
      gem 'twitter'
      bundle
      todo 'Register your application with Twitter: https://dev.twitter.com/apps/new'
      todo 'Copy and paste in your OAuth data:'
      code %{Twitter.configure do |config|
  config.consumer_key = YOUR_CONSUMER_KEY
  config.consumer_secret = YOUR_CONSUMER_SECRET
  config.oauth_token = YOUR_OAUTH_TOKEN
  config.oauth_token_secret = YOUR_OAUTH_TOKEN_SECRET
end}
    end

  end
end
