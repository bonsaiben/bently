module Bently

  class ActionMailer < RailsRecipe

    homepage 'http://guides.rubyonrails.org/action_mailer_basics.html'

    def initialize
      generate 'mailer UserMailer'
      insert 'app/mailers/user_mailer.rb', welcome_email_method, :after => /^.*default.*$/
      create './app/views/user_mailer/welcome_email.html.erb', template('welcome_email.html.erb')
      create './app/views/user_mailer/welcome_email.text.erb', template('welcome_email.text.erb')
    end

    protected

    def welcome_email_method
%{# def welcome_email(user)
  #   @user = user
  #   @url  = "http://example.com/login"
  #   mail(:to => user.email, :subject => "Welcome to My Awesome Site")
  # end}
    end

  end

end
