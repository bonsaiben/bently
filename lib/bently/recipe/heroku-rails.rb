module Bently

  class HerokuRails < Recipe

    step :group_sqlite3_gem_in_test_development
    step :append,  :file => 'Gemfile', :with => "gem 'pg', :group => :production"
    step :shell, 'bundle install --without production'

    step :shell, 'git add Gemfile Gemfile.lock'
    step :shell, 'git commit -m "pg for heroku"'

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
