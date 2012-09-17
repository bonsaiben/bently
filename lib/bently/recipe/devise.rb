module Bently

  class Devise < Recipe
    GEMFILE_DEF = "gem 'devise'"
    RAILS_GENERATOR = "rails g devise:install"
    MODEL_GENERATOR = "rails g devise"
    ASK_MODEL_GENERATOR = "Model name:"

    def bake
      add_gem(GEMFILE_DEF) || return
      bundle_install
      command RAILS_GENERATOR
      ask_command("#{MODEL_GENERATOR} MODEL", ASK_MODEL_GENERATOR){|a| "#{MODEL_GENERATOR} #{a}" }
      super
    end
  end

end
