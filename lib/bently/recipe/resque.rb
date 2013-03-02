module Bently

  class Resque < RailsRecipe

    def initialize
      gem 'resque'
      bundle
      todo 'redis-server'
    end

  end

end
