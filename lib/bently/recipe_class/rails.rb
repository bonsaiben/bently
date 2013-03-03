require 'bently/recipe_class/ruby'
module Bently
  class RailsRecipe < RubyRecipe

    def generate command
      run "rails generate #{command}"
    end

  end
end
