module Bently

  class OmniauthFacebook < RailsRecipe
  
    step :add_gem, "gem 'omniauth'"
    step :add_gem, "gem 'omniauth-facebook'"
    step :shell, 'bundle install'
    step :insert_route
    step :touch_initializer
    step :touch_sessions_controller
    step :insert_user_find

    def insert_route
      insert(
        :file => 'config/routes.rb', 
        :with => "  match '/auth/:provider/callback', to: 'sessions#create'\n", 
        :after => "Application.routes.draw do\n"
      )
    end

    def touch_initializer
      touch(:file => './config/initializers/omniauth.rb', :with => 
%{Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET']
           #:scope => 'email,user_birthday,read_stream', :display => 'popup'
end}
      )
    end

    def touch_sessions_controller
      touch(:file => './app/controllers/sessions_controller.rb', :with => 
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
      )
    end

    def insert_user_find
      insert(
        :file => 'app/models/user.rb', 
        :with => 
%{  def self.find_or_create_from_auth_hash(auth_hash)
    find_or_create_by_fb_uid(auth_hash[:uid])
  end},
        :after => "class User < ActiveRecord::Base\n"
      )
    end

  end

end
