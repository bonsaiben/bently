module Bently

  class TwitterBootstrapRails < Recipe

    GEMFILE_DEF = "gem \"twitter-bootstrap-rails\", :group => :assets"
    RAILS_GENERATOR = "rails g bootstrap:install"

    def bake
      add_gem(GEMFILE_DEF) || return
      bundle_install
      command RAILS_GENERATOR
      super
    end

  end

end
