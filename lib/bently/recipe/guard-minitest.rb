module Bently

  class GuardMinitest < RailsRecipe

    title 'guard-minitest'
    homepage 'https://github.com/guard/guard-minitest/blob/master/README.md'

    def initialize
      gem_group :development do
        gem 'guard-minitest'
      end
      bundle
      run 'guard init minitest'
    end

  end

end
