module Bently

  class HerokuCreate < Recipe

    step :add_pg_gem
    step :shell, 'bundle install'
    step :shell, 'git add Gemfile Gemfile.lock'
    step :shell, 'git commit -m "use pg instead of sqlite3"'
    step :shell, 'heroku create'
    step :shell, 'git push heroku master'
    step :shell, 'heroku ps'
    step :shell, 'heroku open'
    step :shell, 'heroku run rake db:migrate'

  protected

    def add_pg_gem
      modify(
        :file => 'Gemfile', 
        :from => /gem 'sqlite3'/, 
        :to => "gem 'pg'"
      )
    end

  end

end
