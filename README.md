Bently allows you to create executable "recipes" for file and command-line operations that you do a lot.

You can think of it as a Homebrew for Ruby gems.

I created it for quickly settings up and deploying Rails applications.

Installation
============

You'll probably want to add your own custom recipes so I recommend cloning into an easy-to-find directory and build and install the gem from there.

You can install the Gem if you'd prefer.

    gem install bently


Example
=======

I start a new project that needs user authentication so I want to use Devise.
Looking at the Devise README on GitHub I find the necessary steps for installing and configuring Devise.

    add "gem 'devise'" to Gemfile
    bundle install
    rails g devise:install
    rails g devise user

As a Bently recipe, this would look like:

    module Bently
      class Devise < Recipe
        step :append, :file => 'Gemfile', :with => "gem 'devise'"
        step :shell, 'bundle install'
        step :shell, 'rails g devise:install'
        step :shell, 'rails g devise user'
      end
    end

And executing it is as simple as:

    bently bake devise
    
Or if I just want a readout without executing:

    bently read devise

Recipes
=======

A recipe defines a series of steps. There are seven kinds of steps:

Shell

execute a command

    step :shell, 'echo hello'

Touch

create a file with some content

    step :touch, :file => 'file.rb', :with => 'content'

Modify

change a part of a file to something else

    step :modify, :file => 'file.rb', :from => /old_text/, :to => 'new_text'

Append

add content to the end of a file

    step :append, :file => 'file.rb', :with => 'put this at the bottom'

Prepend

add content to beginning of a file

    step :prepend, :file => 'file.rb', :with => 'put this at the top'

Insert

add content before or after some part of a file

    step :insert, :file => 'file.rb', :with => 'insert this', :after => 'after this'

Remove

remove a file

    step :remove, :file => 'delete_me.txt'


You can also define custom steps that reduce to one of the above.

    step :add_gem, "gem 'rails'"
    
    def add_gem gem
      append :file => 'Gemfile', :with => gem
    end

Recipe Templates
================

Recipe templates can be created to encapsulate steps used across multiple recipes.

    module Bently
      class RailsRecipe < Recipe
        GEMFILE = 'Gemfile'
        
        def add_gem gem
          append :file => GEMFILE, :with => gem
        end
        
      end
    end

To use a template, inherit from the template class instead of Recipe.

    class Devise < RailsRecipe

Fork and accumulate your own collection of recipes.