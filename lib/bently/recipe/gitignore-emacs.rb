module Bently

  class GitignoreEmacs < Recipe

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
