Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  #provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET']
  #provider :twitter, ENV['TWITTER_KEY'], ENV['TWITTER_SECRET']
end
