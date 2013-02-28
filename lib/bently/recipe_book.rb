module Bently

  class RecipeBook

    RECIPE_DIR          = "#{BENTLY_REPOSITORY}/lib/recipe/*.rb"
    RECIPE_CLASS_DIR = "#{BENTLY_REPOSITORY}/lib/recipe_class/*.rb"

    def self.all
      Dir[RECIPE_DIR].map{ |f| File.basename f, '.rb' }.sort
    end

    def self.find(recipe)
      recipe.camelize.constantize
    end

  end

end
