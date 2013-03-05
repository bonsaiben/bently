module Bently
  class RspecRails < RailsRecipe

    title 'rspec-rails'
    category 'gem'
    description 'downloads and installs rspec-rails gem'
    homepage 'https://github.com/rspec/rspec-rails/blob/master/README.md'
    version '2.0'

    def initialize
      gem_group :test, :development do
        gem "rspec-rails", "~> 2.0"
      end
      bundle
      generate 'rspec:install'
    end

  end
end
