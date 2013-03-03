module Bently

  class GitignoreOsx < Recipe

    def initialize
      append '.gitignore', gitignore
    end

    protected

    def gitignore
%{.DS_Store
.AppleDouble
.LSOverride
Icon


# Thumbnails
._*

# Files that might appear on external disk
.Spotlight-V100
.Trashes}
    end

  end

end
