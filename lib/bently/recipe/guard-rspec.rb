module Bently

  class GuardRspec < RailsRecipe

    title 'guard-rspec'
    homepage 'https://github.com/guard/guard-rspec/blob/master/README.md'

    def initialize
      gem_group :development do
        gem 'guard-rspec'
      end
      bundle
      run 'guard init rspec'
    end

  end

end
