module Bently

  class Recipebook

    RECIPE_DIR       = "#{BENTLY_REPOSITORY}/lib/bently/recipe/*.rb"
    LOCAL_DIR        = "#{Dir.pwd}/.bently/*.rb"
    RECIPE_CLASS_DIR = "#{BENTLY_REPOSITORY}/lib/bently/recipe_class/*.rb"

    def self.all
      files = Dir[RECIPE_DIR].map{ |f| File.basename f, '.rb' }
      files += Dir[LOCAL_DIR].map{ |f| File.basename f, '.rb' }
      files.sort
    end

    def self.find(recipe)
      "Bently::#{recipe.camelize}".constantize
    end

  end

end
