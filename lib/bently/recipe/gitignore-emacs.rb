module Bently

  class GitignoreEmacs < Recipe

    homepage 'https://github.com/github/gitignore/blob/master/Global/Emacs.gitignore'

    def initialize
      append '.gitignore', template('.gitignore')
    end

  end

end
