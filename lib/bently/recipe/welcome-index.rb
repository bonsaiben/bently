module Bently

  class WelcomeIndex < Recipe

    RAILS_GENERATE = 'bundle exec rails g controller welcome index'
    ROUTES_FILE = 'config/routes.rb'
    GSUB_SEARCH = /#\s*(root :to => 'welcome#index')/
    GSUB_REPLACE = '\1'

    def bake
      command RAILS_GENERATE
      gsub_file ROUTES_FILE, GSUB_SEARCH, GSUB_REPLACE
      super
    end

  end

end
