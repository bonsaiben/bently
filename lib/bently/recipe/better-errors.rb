module Bently
  class BetterErrors < RailsRecipe

    title 'better_errors'
    homepage 'https://github.com/charliesome/better_errors/blob/master/README.md'

    def initialize
      gem_group :development do
        gem 'better_errors'
        gem 'binding_of_caller'
      end
      bundle
    end

  end
end
