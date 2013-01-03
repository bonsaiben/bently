module Bently

  class Guard < RailsRecipe
  
    step :add_gem, "gem 'guard', :group => :development"
    step :shell, 'bundle install'
    step :shell, 'guard init'

  end

end
