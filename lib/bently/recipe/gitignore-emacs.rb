module Bently

  class GitignoreEmacs < Recipe

    homepage 'https://github.com/github/gitignore/blob/master/Global/Emacs.gitignore'

    def initialize
      append '.gitignore', gitignore
    end

    protected

    def gitignore
%{*~
\#*\#
/.emacs.desktop
/.emacs.desktop.lock
.elc
auto-save-list
tramp
.\#*

# Org-mode
.org-id-locations
*_archive}
    end

  end

end
