module Bently

  class GitignoreTextmate < Recipe

    homepage 'https://github.com/github/gitignore/blob/master/Global/TextMate.gitignore'

    def initialize
      append '.gitignore', gitignore
    end

    protected

    def gitignore
%{*.tmproj
*.tmproject
tmtags}
    end

  end

end
