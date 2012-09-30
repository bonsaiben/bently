module Bently

  class TwitterBootstrapRails < RailsRecipe

    step :add_gem, 'gem "twitter-bootstrap-rails", :group => :assets'
    step :shell, 'bundle install'
    step :shell, 'rails g bootstrap:install'

  end

end
