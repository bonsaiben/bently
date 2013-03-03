module Bently

  class GitignoreTextmate < Recipe

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
