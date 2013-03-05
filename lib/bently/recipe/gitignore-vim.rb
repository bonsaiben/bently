module Bently

  class GitignoreVim < Recipe

    homepage 'https://github.com/github/gitignore/blob/master/Global/vim.gitignore'

    def initialize
      append '.gitignore', template('.gitignore')
    end

  end

end
