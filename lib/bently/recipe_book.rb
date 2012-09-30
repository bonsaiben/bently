module Bently

  class RecipeBook

    RECIPE_DIR = "#{BENTLY_REPOSITORY}/lib/bently/recipe/*.rb"

    def self.all
      Dir[RECIPE_DIR].map{ |f| File.basename f, '.rb' }.sort
    end

    def self.find(recipe)
      "Bently::#{recipe.camelize}".constantize
    end
  end
end
