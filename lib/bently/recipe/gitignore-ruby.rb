module Bently

  class GitignoreRuby < Recipe

    homepage 'https://github.com/github/gitignore/blob/master/Ruby.gitignore'

    def initialize
      append '.gitignore', template('.gitignore')
    end

  end

end
