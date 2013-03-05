module Bently

  class GuardSpork < RailsRecipe

    title 'guard-spork'
    homepage 'https://github.com/guard/guard-spork/blob/master/README.md'

    def initialize
      gem_group :development do
        gem 'guard-spork'
      end
      bundle
      run 'guard init spork'
    end

  end

end
