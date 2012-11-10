module Bently

  class GitignoreRails < Recipe

    step :touch_gitignore

  protected

    def touch_gitignore
      touch :file => '.gitignore', :with => gitignore
    end

    def gitignore
%{
# Configuration files
config/initializers/secret_token.rb
config/database.yml

# Generated files
log/*
coverage/*

#Documentation
.yardoc/
doc/

# Uploaded files and local files
public/uploads/*
public/assets/*
tmp/**/*
tmp/*
*.sqlite3
.env

# Temporary files of every sort
.sass-cache/*
.DS_Store
.idea
.rvmrc
*.swap
*.swo
*.swp
*~
*#
nbproject
dump.rdb
}
    end

  end

end
