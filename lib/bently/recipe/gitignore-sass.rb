module Bently

  class GitignoreSass < Recipe

    homepage 'https://github.com/github/gitignore/blob/master/Global/SASS.gitignore'

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
