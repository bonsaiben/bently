module Bently
  class FactoryGirlRails < RailsRecipe

    name 'factory_girl_rails'
    category 'gem'
    description 'downloads and installs factory_girl_rails gem'
    #homepage ''
    #version ''

    def initialize
      gem_group :test do
        gem "factory_girl_rails", "~> 4.0"
      end
      bundle
      create './spec/factories.rb', factory_file
    end

  protected

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
