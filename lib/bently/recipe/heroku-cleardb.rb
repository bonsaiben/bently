module Bently

  class HerokuCleardb < RailsRecipe

    def initialize
      warn 'heroku commands may incur charges to your account'.upcase
      modify 'Gemfile', /gem 'sqlite3'/, ""
      gem 'mysql2'
      bundle

      run 'heroku addons:add cleardb:ignite'

      todo 'Retrieve your database URL by issuing the following command:'
      todo 'heroku config | grep CLEARDB_DATABASE_URL'
      todo 'Copy the value of the CLEARDB_DATABASE_URL config variable to DATABASE_URL (using mysql2:// instead of mysql://):'
      todo "heroku config:add DATABASE_URL='mysql2://...'"
      todo 'Add and commit Gemfile, Gemfile.lock'
      todo 'heroku run rake db:migrate'
    end

  end

end
