module Bently

  class GitignoreRubymine < Recipe

    def initialize
      append '.gitignore', gitignore
    end

    protected

    def gitignore
%{.idea/workspace.xml}
    end

  end

end
