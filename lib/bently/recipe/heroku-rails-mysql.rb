module Bently

  class HerokuRailsMysql < Recipe

    step :group_sqlite3_gem_in_test_development
    step :append,  :file => 'Gemfile', :with => "gem 'mysql2', :group => :production"
    step :append,  :file => 'Gemfile', :with => "gem 'thin'"
    step :shell, 'bundle install --without production'

    step :append, :file => 'Procfile', :with => 'web: bundle exec thin start -p $PORT -e $RACK_ENV'
    step :shell, 'gem install foreman'
    step :shell, 'echo "RACK_ENV=development" >>.env'

    step :shell, 'git add Gemfile Gemfile.lock Procfile'
    step :shell, 'git status'
    step :shell, 'git commit -m "thin for heroku"'

    step :shell, 'heroku create'
    step :shell, 'git push heroku master'

    step :shell, 'heroku addons:add cleardb:ignite'
    step :shell, 'heroku config | grep CLEARDB_DATABASE_URL'
    step :update_database_url

    step :shell, 'heroku run rake db:migrate'

    protected

    def group_sqlite3_gem_in_test_development
      modify(
        :file => 'Gemfile', 
        :from => /gem 'sqlite3'/, 
        :to => "gem 'sqlite3', :group => [:test, :development]"
      )
    end

    def update_database_url
      shell(
        lambda{|url| "heroku config:add DATABASE_URL='#{url}'"},
        :ask => "Copy the database url above (replacing `mysql://` with `mysql2://`):",
        :description => "heroku config:add DATABASE_URL='<database_url>'"
      )
    end
  end

end
