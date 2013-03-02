module Bently
  class Guard < RailsRecipe

    def initialize
      gem_group :development do
        gem 'guard'
      end
      bundle
      run 'guard init'
    end

  end
end
