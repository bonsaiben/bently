module Bently
  class JasmineRails < RailsRecipe

    title 'jasmine-rails'
    category 'gem'
    description 'downloads and installs jasmine-rails gem'
    homepage 'https://github.com/searls/jasmine-rails/blob/master/README.md'

    def initialize
      requirement '`brew install qt` for the headless webkit widget'
      gem_group :test, :development do
        gem 'jasmine-rails'
      end
      bundle
      create 'spec/javascripts/support/jasmine.yml', template('jasmine.yml')
      todo 'Modify spec/javascripts/support/jasmine.yml as necessary.'
    end

  end
end
