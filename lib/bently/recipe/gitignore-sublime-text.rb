module Bently

  class GitignoreSublimeText < Recipe

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

