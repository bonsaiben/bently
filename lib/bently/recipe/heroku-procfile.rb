module Bently

  class HerokuProcfile < RailsRecipe

    step :add_gem, "gem 'thin'"
    step :shell, 'bundle install'
    step :append, 'Procfile', 'web: bundle exec thin start -p $PORT -e $RACK_ENV'
    step :shell, 'gem install foreman'
    step :shell, 'echo "RACK_ENV=development" >>.env'
    step :shell, 'foreman start'

  end

end
