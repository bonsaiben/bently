module Bently
  class TwitterBootstrapRails < RailsRecipe

    name 'twitter-bootstrap-rails'
    category 'gem'
    description 'downloads and installs twitter-bootstrap-rails gem'
    #homepage ''
    version '2.2.0'

    def initialize
      gem 'therubyracer'
      gem 'less-rails'
      gem 'twitter-bootstrap-rails', '~> 2.2.0'
      bundle
      generate 'bootstrap:install less'
    end

  end
end
