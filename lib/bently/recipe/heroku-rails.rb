module Bently

  class HerokuRails < RailsRecipe

    homepage 'https://devcenter.heroku.com/articles/rails3'

    def initialize
      warn 'heroku commands may incur charges to your account'.upcase
      modify 'Gemfile', /gem 'sqlite3'/, ""
      gem 'pg'
      bundle

      run 'git add Gemfile Gemfile.lock'
      run 'git commit -m "postgres gem"'

      run 'heroku create'
      run 'git push heroku master'
      run 'heroku run rake db:migrate'
    end

  end

end
