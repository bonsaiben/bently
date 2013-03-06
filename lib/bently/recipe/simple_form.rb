module Bently
  class SimpleForm < RailsRecipe

    title 'simple_form'
    category 'gem'
    description 'downloads and installs simple_form gem'
    homepage 'https://github.com/plataformatec/simple_form/blob/master/README.md'

    def initialize
      gem 'simple_form'
      bundle
      generate 'simple_form:install'
      todo 'If you want to use the country select, you will need the country_select gem:'
      say 'gem \'country_select\'', ''
      todo 'SimpleForm can be easily integrated to the Twitter Bootstrap. To do that you have to use the bootstrap option in the install generator, like this:'
      say 'rails generate simple_form:install --bootstrap', ''
      say 'You have to be sure that you added a copy of the Twitter Bootstrap assets on your application.', ''
    end

  end
end
