module Bently

  class GuardLivereload < RailsRecipe
  
    step :add_gem, "gem 'guard-livereload', :group => :development"
    step :shell, 'bundle install'
    step :shell, 'guard init livereload'

  end

end
