module Bently

  class GitignoreRubymine < Recipe

    homepage 'https://github.com/github/gitignore/blob/master/Global/RubyMine.gitignore'

    def initialize
      append '.gitignore', gitignore
    end

    protected

    def gitignore
%{.idea/workspace.xml}
    end

  end

end
