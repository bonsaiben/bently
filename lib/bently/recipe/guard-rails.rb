module Bently

  class GuardRails < RailsRecipe

    title 'guard-rails'
    homepage 'https://github.com/guard/guard-rails/blob/master/README.md'

    def initialize
      gem_group :development do
        gem 'guard-rails'
      end
      bundle
      run 'guard init rails'
    end

  end

end
