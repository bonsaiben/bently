module Bently

  class RspecRails < Recipe
    GEMFILE_DEF = %{group :test, :development do
  gem "rspec-rails", "~> 2.0"
end
}
    RAILS_GENERATOR = "rails g rspec:install"

    def bake
      add_gem(GEMFILE_DEF)
      bundle_install
      command RAILS_GENERATOR
      super
    end
  end

end
