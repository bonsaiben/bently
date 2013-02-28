require 'recipe_class/rails'
class HamlRails < RailsRecipe

  name 'haml-rails'
  category 'gem'
  description 'downloads and installs haml and haml-rails gems'
  homepage 'https://github.com/indirect/haml-rails'
  version '0.4'

  def initialize
    gem 'haml'
    gem 'haml-rails'
    bundle
  end

end

