module Bently

  class HerokuRails < Recipe

    step :group_sqlite3_gem_in_test_development
    step :append,  :file => 'Gemfile', :with => "gem 'pg', :group => :production"
    step :append,  :file => 'Gemfile', :with => "gem 'thin'"
    step :shell, 'bundle install --without production'

    step :append, :file => 'Procfile', :with => 'web: bundle exec thin start -p $PORT -e $RACK_ENV'
    step :shell, 'gem install foreman'
    step :shell, 'echo "RACK_ENV=development" >>.env'

    step :shell, 'git add Gemfile Gemfile.lock Procfile'
    step :shell, 'git commit -m "pg and thin for heroku"'

    step :shell, 'heroku create'
    step :shell, 'git push heroku master'
    step :shell, 'heroku run rake db:migrate'

    protected

    def group_sqlite3_gem_in_test_development
      modify(
        :file => 'Gemfile', 
        :from => /gem 'sqlite3'/, 
        :to => "gem 'sqlite3', :group => [:test, :development]"
      )
    end

  end

end
