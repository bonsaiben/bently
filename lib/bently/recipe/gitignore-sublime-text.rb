module Bently

  class GitignoreSublimeText < Recipe

    homepage 'https://github.com/github/gitignore/blob/master/Global/SublimeText.gitignore'

    def initialize
      append '.gitignore', gitignore
    end

    protected

    def gitignore
%{# SublimeText project files
*.sublime-workspace}
    end

  end

end

