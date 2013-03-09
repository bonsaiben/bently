module Bently
  class ActsAsTaggableOn < RailsRecipe

    title 'acts-as-taggable-on'
    homepage 'https://github.com/mbleigh/acts-as-taggable-on/blob/master/README.md'

    def initialize
      gem 'acts-as-taggable-on', '~> 2.3.1'
      bundle
      generate 'acts_as_taggable_on:migration'
      migrate
      usage ''
      code template('usage.rb')
      usage 'See https://github.com/mbleigh/acts-as-taggable-on/blob/master/README.md#usage'
    end

  end
end
