module Bently

  class OmniauthFacebook < RailsRecipe

    def initialize
      gem 'omniauth'
      gem 'omniauth-facebook'
      bundle
      insert 'config/routes.rb', "  match '/auth/:provider/callback', to: 'sessions#create'\n", :after => "Application.routes.draw do\n"
      create './config/initializers/omniauth.rb', omniauth_initializer
      create './app/controllers/sessions_controller.rb', sessions_controller
      insert 'app/models/user.rb', find_or_create_from_auth_hash, :after => "class User < ActiveRecord::Base\n"
    end

    protected

    def omniauth_initializer
%{Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET']
           #:scope => 'email,user_birthday,read_stream', :display => 'popup'
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

    def find_or_create_from_auth_hash
%{  def self.find_or_create_from_auth_hash(auth_hash)
    find_or_create_by_fb_uid(auth_hash[:uid])
  end}
    end

  end

end
