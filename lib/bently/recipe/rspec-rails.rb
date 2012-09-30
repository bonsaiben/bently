module Bently

  class RspecRails < RailsRecipe

    step :add_gem
    step :shell, 'bundle install'
    step :shell, "rails g rspec:install"

  protected

    def add_gem
      super gem_def
    end

    def gem_def
%{group :test, :development do
  gem "rspec-rails", "~> 2.0"
end}
    end

  end

end
