module Bently
  class Carrierwave < RailsRecipe

    title 'carrierwave'
    category 'gem'
    description 'downloads and installs carrierwave gem'
    homepage 'https://github.com/jnicklas/carrierwave/blob/master/README.md'

    def initialize
      gem 'carrierwave'
      bundle
      todo 'Start off by generating an uploader:'
      say '  rails generate uploader Avatar', ''
      todo 'For use with ActiveRecord:'
      say 'Make sure you are loading CarrierWave after loading your ORM, otherwise you\'ll need to require the relevant extension manually, e.g.:', '-'
      say '  require \'carrierwave/orm/activerecord\'','1', :magenta
      say 'Add a string column to the model you want to mount the uploader on:','-'
      say '  add_column :users, :avatar, :string','1', :magenta
      say 'Open your model file and mount the uploader:','-'
      say '  class User < ActiveRecord::Base','1', :magenta
      say '    mount_uploader :avatar, AvatarUploader','2', :magenta
      say '  end','3', :magenta
      say 'Now you can cache files by assigning them to the attribute, they will automatically be stored when the record is saved.','-'
      say '  u = User.new', '1', :magenta
      say '  u.avatar = params[:file]', '2', :magenta
      say '  u.avatar = File.open(\'somewhere\')', '3', :magenta
      say '  u.save!', '4', :magenta
      say '  u.avatar.url # => \'/url/to/file.png\'', '5', :magenta
      say '  u.avatar.current_path # => \'path/to/file.png\'', '6', :magenta
      say '  u.avatar.identifier # => \'file.png\'', '7', :magenta
    end

  end
end
