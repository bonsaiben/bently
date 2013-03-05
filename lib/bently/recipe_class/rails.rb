require 'bently/recipe_class/ruby'
module Bently
  class RailsRecipe < RubyRecipe

    def generate command
      run "bundle exec rails generate #{command}"
    end

    def migrate
      run 'bundle exec rake db:migrate'
    end

  end
end
