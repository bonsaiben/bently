module Bently

  class GitignoreWindows < Recipe

    homepage 'https://github.com/github/gitignore/blob/master/Global/Windows.gitignore'

    def initialize
      append '.gitignore', template('.gitignore')
    end

  end

end
