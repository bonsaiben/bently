require 'thor'

require 'bently/core_ext/string'
require 'bently/globals'
require 'bently/step'
require 'bently/recipe'
require 'bently/recipe_template/rails.rb'
require 'bently/recipe_book'
require 'bently/clo'
require 'bently/himself'

Dir[Bently::RecipeBook::RECIPE_DIR].map do |f|
  File.basename f, '.rb'
end.each do |f|
  require 'bently/recipe/' + f
end

