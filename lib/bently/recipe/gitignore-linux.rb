module Bently

  class GitignoreLinux < Recipe

    def initialize
      append '.gitignore', gitignore
    end

    protected

    def gitignore
%{.*
!.gitignore
*~}
    end

  end

end
