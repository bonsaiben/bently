module Bently

  class GitignoreRails < Recipe

    def initialize
      append '.gitignore', gitignore
    end

    protected

    def gitignore
%{*.rbc
*.sassc
.sass-cache
capybara-*.html
.rspec
.rvmrc
/.bundle
/vendor/bundle
/log/*
/tmp/*
/db/*.sqlite3
/public/system/*
/coverage/
/spec/tmp/*
**.orig
rerun.txt
pickle-email-*.html
.project}
    end

  end

end
