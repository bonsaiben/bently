require 'thor'

require 'bently/core_ext/string'
require 'bently/globals'
require 'recipe'
require 'bently/recipe_book'
require 'bently/base'

Dir[Bently::RecipeBook::RECIPE_DIR].map do |f|
  File.basename f, '.rb'
end.each do |f|
  require 'recipe/' + f
end

Dir[Bently::RecipeBook::RECIPE_CLASS_DIR].map do |f|
  File.basename f, '.rb'
end.each do |f|
  require 'recipe_class/' + f
end

