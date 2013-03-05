module Bently

  class GitignoreTextmate < Recipe

    homepage 'https://github.com/github/gitignore/blob/master/Global/TextMate.gitignore'

    def initialize
      append '.gitignore', template('.gitignore')
    end

  end

end
