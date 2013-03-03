module Bently

  class OmniauthFacebook < RailsRecipe

    homepage 'https://github.com/mkdynamic/omniauth-facebook/blob/master/README.md'

    def initialize
      requirement 'omniauth'
      gem 'omniauth-facebook'
      bundle
      insert './config/initializers/omniauth.rb', omniauth_initializer, :after => "Rails.application.config.middleware.use OmniAuth::Builder do\n"
    end

    protected

    def omniauth_initializer
%{provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET']
}
    end

  end

end
