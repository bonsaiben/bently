module Bently

  class Omniauth < RailsRecipe

    homepage 'https://github.com/intridea/omniauth/blob/master/README.md'

    def initialize
      gem 'omniauth'
      bundle
      create './config/initializers/omniauth.rb', template('omniauth.rb')
      insert 'config/routes.rb', "  match '/auth/:provider/callback', to: 'sessions#create'\n", :after => "Application.routes.draw do\n"
      create './app/controllers/sessions_controller.rb', template('sessions_controller.rb')
      todo 'implement User#find_or_create_from_auth_hash'
    end

  end

end
