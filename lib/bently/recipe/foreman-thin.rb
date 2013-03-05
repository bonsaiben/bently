module Bently
  class ForemanThin < RailsRecipe

    title 'foreman-thin'
    category 'gem'
    description 'downloads and installs foreman and thin Ruby gems'
    homepage 'https://devcenter.heroku.com/articles/rails3#webserver'

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
