module Bently

  class Rvmrc < Recipe

    def initialize
      run "echo \"rvm use --create 1.9.3@gemsetname\" > .rvmrc"
    end

  end

end
