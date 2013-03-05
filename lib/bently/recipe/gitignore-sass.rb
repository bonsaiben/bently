module Bently

  class GitignoreSass < Recipe

    homepage 'https://github.com/github/gitignore/blob/master/Global/SASS.gitignore'

    def initialize
      append '.gitignore', template('.gitignore')
    end

  end

end
