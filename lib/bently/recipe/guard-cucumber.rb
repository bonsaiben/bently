module Bently

  class GuardCucumber < RailsRecipe

    title 'guard-cucumber'
    homepage 'https://github.com/guard/guard-cucumber/blob/master/README.md'

    def initialize
      gem_group :development do
        gem 'guard-cucumber'
      end
      bundle
      run 'guard init cucumber'
    end

  end

end
