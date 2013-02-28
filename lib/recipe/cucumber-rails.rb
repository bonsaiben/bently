require 'recipe_class/rails'
class CucumberRails < RailsRecipe

  name 'cucumber-rails'
  category 'gem'
  description 'downloads and installs cucumber-rails gem'
  homepage 'https://github.com/cucumber/cucumber-rails'
  version '1.3.0'

  def initialize
    gem_group [:test, :development] do
      gem "cucumber-rails", require: false
      gem "database_cleaner"
    end
    bundle
    generate 'cucumber:install'
  end

end
