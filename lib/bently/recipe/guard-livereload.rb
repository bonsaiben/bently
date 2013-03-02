module Bently

  class GuardLivereload < RailsRecipe

    def initialize
      gem_group :development do
        gem 'guard-livereload'
      end
      bundle
      run 'guard init livereload'
    end

  end

end
