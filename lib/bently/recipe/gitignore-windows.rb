module Bently

  class GitignoreWindows < Recipe

    homepage 'https://github.com/github/gitignore/blob/master/Global/Windows.gitignore'

    def initialize
      append '.gitignore', gitignore
    end

    protected

    def gitignore
%{# Windows image file caches
Thumbs.db
ehthumbs.db

# Folder config file
Desktop.ini

# Recycle Bin used on file shares
$RECYCLE.BIN/}
    end

  end

end
