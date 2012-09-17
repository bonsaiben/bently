module Bently

  class CLI < Thor
    include Thor::Actions

    desc 'list', 'list recipes'
    def list
      Recipe.list.each {|f| puts f }
    end

    desc 'read [RECIPE]', 'display a recipe'
    def read recipe_name
      bake recipe_name, true
    end

    desc 'bake [RECIPE]', 'execute a recipe'
    def bake(recipe_name, read_only=false)
      if Recipe.list.include?(recipe_name)
        recipe = Recipe.from_name(recipe_name).new(:read_only => read_only)
        recipe.bake
      else
        puts "Recipe not found."
      end
    end
  end

end
