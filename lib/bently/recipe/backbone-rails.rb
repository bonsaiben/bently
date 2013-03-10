module Bently
  class BackboneRails < RailsRecipe

    homepage 'https://github.com/codebrew/backbone-rails/blob/master/README.md'

    def initialize
      gem 'rails-backbone'
      bundle
      generate 'backbone:install'
      usage 'Generators:'
      say 'rails g backbone:model', ''
      say 'rails g backbone:router', ''
      say 'rails g backbone:scaffold', ''
    end

  end
end
