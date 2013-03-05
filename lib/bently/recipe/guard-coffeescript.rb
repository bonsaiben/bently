module Bently

  class GuardCoffeescript < RailsRecipe

    title 'guard-coffeescript'
    homepage 'https://github.com/guard/guard-coffeescript/blob/master/README.md'

    def initialize
      gem_group :development do
        gem 'guard-coffeescript'
      end
      bundle
      run 'guard init coffeescript'
    end

  end

end
