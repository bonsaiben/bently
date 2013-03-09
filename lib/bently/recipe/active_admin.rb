module Bently
  class ActiveAdmin < RailsRecipe

    title 'active_admin'
    homepage 'https://github.com/gregbell/active_admin/blob/master/README.rdoc'

    def initialize
      gem 'activeadmin'
      bundle
      generate 'active_admin:install'
      migrate
    end

  end
end
