module Bently

  class ResqueRails < RailsRecipe

    homepage 'https://github.com/defunkt/resque/blob/master/README.md'

    def initialize
      requirement "redis (OS X: \`brew install redis\`, \`redis-server /usr/local/etc/redis.conf\`)"
      gem 'resque'
      bundle
      create 'lib/tasks/resque.rake', "require 'resque/tasks'"
      todo 'redis-server'
      todo "If you want to use the front end, add to config/routes.rb:"
      say "require 'resque/server'", ''
      say '  mount Resque::Server, :at => "/resque"', ''
    end

  end

end
