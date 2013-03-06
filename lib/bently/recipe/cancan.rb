module Bently
  class Cancan < RailsRecipe

    title 'cancan'
    category 'gem'
    description 'downloads and installs cancan gem'
    homepage 'https://github.com/ryanb/cancan/blob/master/README.rdoc'

    def initialize
      gem 'cancan'
      bundle
      generate 'cancan:ability'
      todo 'See Defining Abilities: https://github.com/ryanb/cancan/wiki/defining-abilities'
      todo 'See Checking Abilities: https://github.com/ryanb/cancan/wiki/checking-abilities'
      todo 'See Authorizing Controller Actions: https://github.com/ryanb/cancan/wiki/authorizing-controller-actions'
      todo 'See Exception Handling: https://github.com/ryanb/cancan/wiki/exception-handling'
      todo 'See Ensure Authorization: https://github.com/ryanb/cancan/wiki/Ensure-Authorization'
    end

  end
end
