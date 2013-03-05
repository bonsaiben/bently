module Bently

  class GitignoreRubymine < Recipe

    homepage 'https://github.com/github/gitignore/blob/master/Global/RubyMine.gitignore'

    def initialize
      append '.gitignore', template('.gitignore')
    end

  end

end
