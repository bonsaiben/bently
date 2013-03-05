module Bently

  class MinitestRails < RailsRecipe

    title 'minitest-rails'
    homepage 'https://github.com/blowmage/minitest-rails/blob/master/README.rdoc'

    def initialize
      requirement 'Create a new rails app without Test::Unit: `rails new MyApp --skip-test-unit`'
      gem 'minitest-rails'
      bundle
    end

  end

end
