module Bently

  class Paperclip < RailsRecipe

    title 'paperclip'
    homepage 'https://github.com/thoughtbot/paperclip/blob/master/README.md'

    def initialize
      requirement 'Install ImageMagick. For Mac OS X use Homebrew: `brew install imagemagick`'
      requirement 'Source ImageMagick path (`which convert`) in development environment file. For example:'

      say '  Paperclip.options[:command_path] = "/usr/local/bin/"', ''
      gem 'paperclip', "~> 3.0"
      bundle

      todo 'Sample model:'
      say '  class User < ActiveRecord::Base', ''
      say '    attr_accessible :avatar', ''
      say '    has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"', ''
      say '  end', ''
      todo 'Sample migration generator:'
      say '  rails generate paperclip user avatar', ''
      todo 'Sample edit/new views:'
      say '  <%= form_for @user, :url => users_path, :html => { :multipart => true } do |form| %>',''
      say '    <%= form.file_field :avatar %>',''
      say '  <% end %>',''
      todo 'Sample controller:'
      say '  def create',''
      say '    @user = User.create( params[:user] )',''
      say '  end',''
      todo 'Sample show view:'
      say '  <%= image_tag @user.avatar.url %>', ''
      say '  <%= image_tag @user.avatar.url(:medium) %>', ''
      say '  <%= image_tag @user.avatar.url(:thumb) %>', ''
    end

  end

end
