module Bently

  class GitignoreRuby < Recipe

    homepage 'https://github.com/github/gitignore/blob/master/Ruby.gitignore'

    def initialize
      append '.gitignore', gitignore
    end

    protected

    def gitignore
%{*.gem
*.rbc
.bundle
.config
coverage
InstalledFiles
lib/bundler/man
pkg
rdoc
spec/reports
test/tmp
test/version_tmp
tmp

# YARD artifacts
# .yardoc
# _yardoc
# doc/}
    end

  end

end
