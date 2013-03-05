module Bently

  class GitignoreSublimeText < Recipe

    homepage 'https://github.com/github/gitignore/blob/master/Global/SublimeText.gitignore'

    def initialize
      append '.gitignore', template('.gitignore')
    end

  end

end

