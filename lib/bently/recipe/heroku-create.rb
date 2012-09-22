module Bently

  class HerokuCreate < Recipe

    DB_GEM_GSUB = {
      :from => /gem 'sqlite3'/,
      :to => "gem 'pg'"
    }
    COMMIT_GEMFILE = 'git add Gemfile;git commit -m "use pg instead of sqlite3"'
    HEROKU_CREATE = 'heroku create'
    GIT_PUSH_HEROKU = 'git push heroku master'
    HEROKU_PS = 'heroku ps'
    HEROKU_OPEN = 'heroku open'
    HEROKU_MIGRATE_DB = 'heroku run rake db:migrate'

    def bake
      gsub_file GEMFILE, DB_GEM_GSUB[:from], DB_GEM_GSUB[:to]
      bundle_install
      command COMMIT_GEMFILE
      command HEROKU_CREATE
      command GIT_PUSH_HEROKU
      command HEROKU_PS
      command HEROKU_OPEN
      command HEROKU_MIGRATE_DB
      super
    end

  end

end
