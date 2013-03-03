module Bently

  class GitignoreVim < Recipe

    def initialize
      append '.gitignore', gitignore
    end

    protected

    def gitignore
%{.*.s[a-w][a-z]
*.un~
Session.vim
.netrwhist
*~}
    end

  end

end
