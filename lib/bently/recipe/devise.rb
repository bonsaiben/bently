module Bently

  class Devise < RailsRecipe
  
    step :add_gem, "gem 'devise'"
    step :shell, 'bundle install'
    step :shell, 'rails g devise:install'
    step :generate_model

    def generate_model
      shell(
        lambda{|model| "rails g devise #{model}" }, 
        :ask => "Enter a model name (ex. user):", 
        :description => "Execute:\nrails g devise MODEL"
      )
    end

  end

end
