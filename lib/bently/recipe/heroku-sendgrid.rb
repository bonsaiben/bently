module Bently

  class HerokuSendgrid < RailsRecipe

    homepage 'https://devcenter.heroku.com/articles/sendgrid#ruby-rails'

    def initialize
      warn 'heroku commands may incur charges to your account'.upcase
      run 'heroku addons:add sendgrid:starter'
      create './config/initializers/mail.rb', template('mail.rb')
    end

  end

end
