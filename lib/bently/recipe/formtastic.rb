module Bently
  class Formtastic < RailsRecipe

    title 'formtastic'
    category 'gem'
    description 'downloads and installs formtastic gem'
    homepage 'https://github.com/justinfrench/formtastic/blob/master/README.textile'

    def initialize
      gem 'formtastic'
      bundle
      generate 'formtastic:install'
    end

  end
end
