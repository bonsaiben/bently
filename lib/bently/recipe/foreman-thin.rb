module Bently
  class FormanThin < RailsRecipe

    name 'forman-thin'
    category 'gem'
    description 'downloads and installs forman and thin gems'
    homepage 'https://github.com/plataformatec/devise'
    #version ''

    def initialize
      gem 'thin'
      bundle
      append 'Procfile', 'web: bundle exec thin start -p $PORT -e $RACK_ENV'
      run 'gem install foreman'
      run 'echo "RACK_ENV=development" >>.env'
      todo 'foreman start'
    end

  end
end
