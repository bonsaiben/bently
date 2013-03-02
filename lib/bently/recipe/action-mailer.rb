module Bently

  class ActionMailer < RailsRecipe

    def initialize
      generate 'mailer UserMailer'
      insert 'app/mailers/user_mailer.rb', welcome_email_method, :after => /^.*default.*$/
      create './app/views/user_mailer/welcome_email.html.erb', welcome_email_html
      create './app/views/user_mailer/welcome_email.text.erb', welcome_email_text
    end

    protected

    def welcome_email_method
%{
  # def welcome_email(user)
  #   @user = user
  #   @url  = "http://example.com/login"
  #   mail(:to => user.email, :subject => "Welcome to My Awesome Site")
  # end
}
    end

    def welcome_email_html
%{
<!DOCTYPE html>
<html>
  <head>
    <meta content="text/html; charset=UTF-8" http-equiv="Content-Type" />
  </head>
  <body>
    <h1>Welcome to example.com, <%= @user.name %></h1>
    <p>
      You have successfully signed up to example.com,
      your username is: <%= @user.login %>.<br/>
    </p>
    <p>
      To login to the site, just follow this link: <%= @url %>.
    </p>
    <p>Thanks for joining and have a great day!</p>
  </body>
</html>
}
    end

    def welcome_email_text
%{
Welcome to example.com, <%= @user.name %>
===============================================

You have successfully signed up to example.com,
your username is: <%= @user.login %>.

To login to the site, just follow this link: <%= @url %>.

Thanks for joining and have a great day!
}
    end

  end

end
