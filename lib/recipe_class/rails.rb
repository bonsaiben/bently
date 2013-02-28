require 'recipe_class/ruby'
class RailsRecipe < RubyRecipe

  def generate command
    run "rails generate #{command}"
  end

end
