module Bently

  class GitignoreVim < Recipe

    homepage 'https://github.com/github/gitignore/blob/master/Global/vim.gitignore'

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
