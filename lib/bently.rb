require 'thor'

require 'bently/core_ext/string'
require 'bently/core_ext/method'
require 'bently/globals'
require 'bently/recipe'
require 'bently/recipebook'
require 'bently/base'

Dir[Bently::Recipebook::RECIPE_CLASS_DIR].map do |f|
  File.basename f, '.rb'
end.each do |f|
  require 'bently/recipe_class/' + f
end

Dir[Bently::Recipebook::RECIPE_DIR].map do |f|
  File.basename f, '.rb'
end.each do |f|
  require 'bently/recipe/' + f
end

Dir[Bently::Recipebook::LOCAL_DIR].each {|file| require file }
