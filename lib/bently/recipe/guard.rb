module Bently
  class Guard < RailsRecipe

    homepage 'https://github.com/guard/guard/blob/master/README.md'

    def initialize
      gem_group :development do
        gem 'guard'
      end
      bundle
      run 'guard init'
    end

  end
end
