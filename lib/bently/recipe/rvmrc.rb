module Bently

  class Rvmrc < Recipe
  
    step :touch_rvmrc

    def touch_rvmrc
      ruby_version = `rvm current`.chomp
      shell(
        lambda{|gemset| "echo \"rvm use --create #{ruby_version}@#{gemset}\" > .rvmrc" }, 
        :ask => "Enter a gemset name:", 
        :description => "Touch .rvmrc:\nrvm use --create #{ruby_version}@<gemset>"
      )
    end

  end

end
