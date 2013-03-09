module Bently
  class Kaminari < RailsRecipe

    title 'kaminari'
    homepage 'https://github.com/amatsuda/kaminari/blob/master/README.rdoc'

    def initialize
      gem 'kaminari'
      bundle
      generate 'active_admin:install'
      migrate
      usage 'The page scope. To fetch the 7th page of users (default per_page is 25):'
      say '  User.page(7)', '1', :magenta
      usage 'To show a lot more users per each page (change the per_page value)'
      say '  User.page(7).per(50)', '1', :magenta
      usage 'Occasionally you need to pad a number of records that is not a multiple of the page size.'
      say '  User.page(7).per(50).padding(3)', '1', :magenta
    end

  end
end
