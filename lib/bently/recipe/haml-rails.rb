module Bently

  class HamlRails < RailsRecipe

    step :add_gem, "gem 'haml'"
    step :add_gem, "gem 'haml-rails'"
    step :shell, 'bundle install'

  end

end
