module Bently

  class GitignoreSass < Recipe

    def initialize
      append '.gitignore', gitignore
    end

    protected

    def gitignore
%{### SASS Ignores - "Sassy CSS" http://sass-lang.com/
*.sass-cache
}
    end

  end

end
