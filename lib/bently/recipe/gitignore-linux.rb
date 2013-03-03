module Bently

  class GitignoreLinux < Recipe

    homepage 'https://github.com/github/gitignore/blob/master/Global/Linux.gitignore'

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
