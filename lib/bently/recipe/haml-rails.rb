module Bently
  class HamlRails < RailsRecipe

    title 'haml-rails'
    category 'gem'
    description 'downloads and installs haml Ruby gem with haml-rails Ruby gem'
    homepage 'https://github.com/haml/haml/blob/master/README.md'

    def initialize
      gem 'haml'
      gem 'haml-rails'
      bundle
    end

  end
end
