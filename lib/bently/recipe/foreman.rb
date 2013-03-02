module Bently
  class Foreman < RubyRecipe

    name 'foreman'
    category 'gem'
    description 'downloads and installs foreman gem'
    #homepage ''
    #version ''

    def initialize
      append 'Procfile', 'web: bundle exec rails server -p $PORT -e $RACK_ENV'
      run 'gem install foreman'
      run 'echo "RACK_ENV=development" >>.env'
      todo 'foreman start'
    end

  end
end
