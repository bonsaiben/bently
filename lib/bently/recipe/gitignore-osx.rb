module Bently

  class GitignoreOsx < Recipe

    homepage 'https://github.com/github/gitignore/blob/master/Global/OSX.gitignore'

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
