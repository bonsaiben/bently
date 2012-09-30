module Bently

  class Gitignore < Recipe

    step :touch_gitignore

  protected

    def touch_gitignore
      touch :file => '.gitignore', :with => gitignore
    end

    def gitignore
%{.DS_Store
.rvmrc
*.swap
*.swo
*.swp}
    end

  end

end
