module Bently

  class WelcomeIndex < Recipe

    step :shell, 'bundle exec rails g controller welcome index'
    step :modify, :file => 'config/routes.rb', :from => /#\s*(root :to => 'welcome#index')/, :to => '\1'

  end

end
