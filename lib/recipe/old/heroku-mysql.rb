module Bently

  class HerokuMysql < Recipe

    step :group_sqlite3_gem_in_test_development
    step :append,  :file => 'Gemfile', :with => "gem 'mysql2', :group => :production"
    step :shell, 'bundle install --without production'

    step :shell, 'git add Gemfile Gemfile.lock'
    step :shell, 'git status'
    step :shell, 'git commit -m "add mysql2 gem"'
    step :shell, 'git push heroku'

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
