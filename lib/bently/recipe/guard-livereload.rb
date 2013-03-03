module Bently

  class GuardLivereload < RailsRecipe

    homepage 'https://github.com/guard/guard-livereload/blob/master/README.md'

    def initialize
      gem_group :development do
        gem 'guard-livereload'
      end
      bundle
      run 'guard init livereload'
    end

  end

end
