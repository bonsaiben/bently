module Bently

  class TwitterBootstrapRails < RailsRecipe

    step :add_gem, 'gem "therubyracer"'
    step :add_gem, 'gem "less-rails"'
    step :add_gem, 'gem "twitter-bootstrap-rails", "~> 2.2.0"'
    step :shell, 'bundle install'
    step :shell, 'rails generate bootstrap:install less'

  end

end
