module Bently

  class HerokuSendgrid < RailsRecipe

    step :heroku, 'addons:add sendgrid:starter'
    step :touch_mail_initializer

  protected

    def heroku command
      shell("heroku #{command}")
    end

    def touch_mail_initializer
      touch(
        :file => "./config/initializers/mail.rb",
        :with => mail_initializer
      )
    end

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
