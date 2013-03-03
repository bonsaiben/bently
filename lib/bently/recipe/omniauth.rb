module Bently

  class Omniauth < RailsRecipe

    homepage 'https://github.com/intridea/omniauth/blob/master/README.md'

    def initialize
      gem 'omniauth'
      bundle
      create './config/initializers/omniauth.rb', omniauth_initializer
      insert 'config/routes.rb', "  match '/auth/:provider/callback', to: 'sessions#create'\n", :after => "Application.routes.draw do\n"
      create './app/controllers/sessions_controller.rb', sessions_controller
      todo 'implement User#find_or_create_from_auth_hash'
    end

    protected

    def omniauth_initializer
%{Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  #provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET']
  #provider :twitter, ENV['TWITTER_KEY'], ENV['TWITTER_SECRET']
end}
    end

    def sessions_controller
%{class SessionsController < ApplicationController
  def create
    @user = User.find_or_create_from_auth_hash(auth_hash)
    self.current_user = @user
    redirect_to '/'
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end}
    end

  end

end
