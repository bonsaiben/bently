module Bently

  class HerokuSendgrid < RailsRecipe

    homepage 'https://devcenter.heroku.com/articles/sendgrid#ruby-rails'

    def initialize
      warn 'heroku commands may incur charges to your account'.upcase
      run 'heroku addons:add sendgrid:starter'
      create './config/initializers/mail.rb', mail_initializer
    end

    protected

    def mail_initializer
%{
ActionMailer::Base.smtp_settings = {
  :address        => 'smtp.sendgrid.net',
  :port           => '587',
  :authentication => :plain,
  :user_name      => ENV['SENDGRID_USERNAME'],
  :password       => ENV['SENDGRID_PASSWORD'],
  :domain         => 'heroku.com'
}
ActionMailer::Base.delivery_method = :smtp
}
    end

  end

end
