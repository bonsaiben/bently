module Bently
  class FactoryGirlRails < RailsRecipe

    title 'factory_girl_rails'
    category 'gem'
    description 'downloads and installs factory_girl_rails gem'
    homepage 'https://github.com/thoughtbot/factory_girl_rails/blob/master/README.md'

    def initialize
      gem_group :test do
        gem "factory_girl_rails", "~> 4.0"
      end
      bundle
      create './spec/factories.rb', template('factories.rb')
    end

  end
end
