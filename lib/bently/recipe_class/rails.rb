require 'bently/recipe_class/ruby'
module Bently
  class RailsRecipe < RubyRecipe

    def generate command
      run "bundle exec rails generate #{command}"
    end

  end
end
