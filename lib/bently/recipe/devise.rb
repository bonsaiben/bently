module Bently
  class Devise < RailsRecipe

    name 'devise'
    category 'gem'
    description 'downloads and installs devise gem'
    homepage 'https://github.com/plataformatec/devise/blob/master/README.md'
    version '2.0'

    def initialize
      gem 'devise'
      bundle
      generate 'devise:install'
      todo 'rails generate devise MODEL'
    end

  end
end
