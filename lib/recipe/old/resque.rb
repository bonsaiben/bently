module Bently

  class Resque < RailsRecipe

    step :add_gem, "gem 'resque'"
    step :shell, 'bundle install'
    
  end

end
