module Bently

  class GitignoreRails < Recipe

    homepage 'https://github.com/github/gitignore/blob/master/Rails.gitignore'

    def initialize
      append '.gitignore', template('.gitignore')
    end

  end

end
