module Bently

  class FactoryGirlRails < RailsRecipe

    step :add_gem, 'gem "factory_girl_rails", "~> 4.0", :group => :test'
    step :shell, 'bundle install'
    step :sample_factory_file

  protected

    def sample_factory_file
      touch :file => './spec/factories.rb', :with => factory_file
    end

    def factory_file
%{#  # This will guess the User class
#  FactoryGirl.define do
#    factory :user do
#      first_name "John"
#      last_name  "Doe"
#      admin false
#    end
#  
#    # This will use the User class (Admin would have been guessed)
#    factory :admin, class: User do
#      first_name "Admin"
#      last_name  "User"
#      admin      true
#    end
#  end}
    end

  end

end
