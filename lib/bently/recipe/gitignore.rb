module Bently

  class Gitignore < Recipe

    GITIGNORE = 
%{.DS_Store
.rvmrc
*.swap
*.swo
*.swp
}

    def bake
      create_file ".gitignore", GITIGNORE
      super
    end
  end
end
