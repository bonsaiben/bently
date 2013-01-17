module Bently

  class Foreman < Recipe

    step :append, :file => 'Procfile', :with => 'web: bundle exec rails server -p $PORT'
    step :shell, 'gem install foreman'
    step :shell, 'echo "RACK_ENV=development" >>.env'
    step :shell, 'foreman start'

  end

end
