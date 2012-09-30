module Bently

  class RailsRecipe < Recipe
    GEMFILE = 'Gemfile'

    # step :add_gem, "gem 'rails'"
    def add_gem *args
      data = args.shift
      append :file => GEMFILE, :with => data
    end
  end

end
