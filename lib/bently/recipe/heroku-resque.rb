module Bently

  class HerokuResque < RailsRecipe

    step :shell, 'echo', :description => "WARNING:\nSome steps in this recipe may incur fees to your Heroku account. By proceeding you agree to bear full responsibility for fees charged to you as a result.", :action => 'proceed', :fail_on_skip => true
    step :add_gem, "gem 'resque', \"~> 1.22.0\""
    step :shell, 'bundle install'
    step :append, :file => 'Procfile', :with => 'resque: env TERM_CHILD=1 bundle exec rake jobs:work'
    step :touch_rakefile
    step :touch_sample_worker
    step :prepend, :file => 'config/routes.rb', :with =>  "require 'resque/server'"
    step :mount_resque_server
    step :shell, "heroku addons:add redistogo:nano"
    step :shell, 'heroku config | grep REDISTOGO_URL'
    step :touch_resque_initializer
    step :shell, 'echo REDISTOGO_URL=redis://localhost:6379 >> .env;more .env'
    step :shell, 'heroku ps:scale resque=1'

  protected

    def touch_rakefile
      touch(
        :file => "./lib/tasks/resque.rake", 
        :with => rakefile
      )
    end

    def rakefile
%{require 'resque/tasks'

task "resque:setup" => :environment do
  ENV['QUEUE'] = '*'
end

desc "Alias for resque:work (To run workers on Heroku)"
task "jobs:work" => "resque:work"}
    end

    def touch_sample_worker
      touch(
        :file => './app/workers/sample_worker.rb', 
        :with => sample_worker
      )
    end

    def sample_worker
%{# class SampleWorker
#   @queue = :sample
# 
#   def self.perform(resource_id)
#     resource = Resource.find(resource_id)
#     resource.do_something!
#   end
# end}
    end

    def mount_resque_server
      insert(
        :file => 'config/routes.rb', 
        :with => "  mount Resque::Server.new, :at => \"/resque\"\n", 
        :after => "Application.routes.draw do\n"
      )
    end

    def touch_resque_initializer
      touch :file => 'config/initializers/resque.rb', :with => resque_initializer
    end

    def resque_initializer
%{# don't initialize unless ENV hash is present
if ENV["REDISTOGO_URL"].present?
  uri = URI.parse(ENV["REDISTOGO_URL"])
  Resque.redis = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)
end}
    end

  end

end
