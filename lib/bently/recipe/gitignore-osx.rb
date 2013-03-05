module Bently

  class GitignoreOsx < Recipe

    homepage 'https://github.com/github/gitignore/blob/master/Global/OSX.gitignore'

    def initialize
      append '.gitignore', template('.gitignore')
    end

  end

end
