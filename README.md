[<img src="https://secure.travis-ci.org/bonsaiben/bently.png">](http://travis-ci.org/bonsaiben/bently)

Bently allows you to create executable "recipes" for file and command-line operations that you do a lot.

You can think of it as like a Homebrew for smaller, application-level installations and operations.

I created it for rapid prototyping Rails applications.

Installation
============

I recommend cloning into an easy-to-find directory and build/install from there so that you can easily add your own custom recipes.

    $ git clone https://github.com/bonsaiben/bently.git
    $ gem build bently.gemspec
    $ gem install bently-x.y.z.gem

Or you can install the Gem normally.

    $ gem install bently
    
    
Basic Usage
==============

    bently list           # list recipes
    bently read [RECIPE]  # display a recipe
    bently bake [RECIPE]  # execute a recipe


Example
=======

Adding devise to your Rails application.

    $ bently bake devise
    
You will be prompted before each step with a description of the operation and the option to skip.

If you only want to preview the steps that would be executed by a recipe, run:

    $ bently read devise
    1. Append to Gemfile:
      gem 'devise'
    2. Execute:
      bundle install
    3. Execute:
      rails g devise:install
    4. Execute:
      rails g devise <model>

Here is what the recipe for devise looks like:

    module Bently
      class Devise < Recipe
        step :append, :file => 'Gemfile', :with => "gem 'devise'"
        step :shell, 'bundle install'
        step :shell, 'rails g devise:install'
        step :generate_model

        def generate_model
          shell(
            lambda{|model| "rails g devise #{model}" },
            :ask => "Enter a model name (eg. user):",
            :description => "Execute:\nrails g devise <model>"
          )
        end
      end
    end


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

    step :add_gem, "rails"
    
    def add_gem gem
      append :file => 'Gemfile', :with => "gem '#{gem}'"
    end

Recipe Templates
================

Recipe templates can be created to encapsulate steps used across multiple recipes.

    module Bently
      class RailsRecipe < Recipe
        GEMFILE = 'Gemfile'
        
        def add_gem gem
          append :file => GEMFILE, :with => "gem '#{gem}'"
        end
        
      end
    end

To use a template, inherit from the template class instead of from Recipe.

    class Devise < RailsRecipe

License
-------
Released under the MIT License.  See the [LICENSE][] file for further details.

[license]: LICENSE
