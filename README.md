[<img src="https://secure.travis-ci.org/bonsaiben/bently.png">](http://travis-ci.org/bonsaiben/bently)

Bently is a community maintained library of executable recipes for rapid application development. The bulk of recipes are for automating installation and configuration of commonly-used dependencies. Another potential use case is feature scaffolding, or laying down basic implementation for common functionality like social authentication.

The goal of Bently is to reduce duplication in the development process across projects, with rapid prototyping in mind.

Bently is Homebrew meets Rails generators.

Bently is built on top of Thor.


Installation
============

    gem install bently


Usage
=====

    bently list                   # list all recipes
    bently list [STRING]          # search recipes matching a string
    bently read [RECIPE]          # display a recipe without executing it
    bently bake [RECIPE]          # execute all steps in recipe
    bently bake [RECIPE] --step   # execute a recipe step by step, prompting before each step
    bently source [RECIPE]        # output the URL for the document on which the recipe is based


Example
=======

Installing and configuring devise in a Rails application.

    $ bently bake devise
        gemfile  devise
              1  
              2  gem "devise"
            run  bundle install from "."
            run  rails generate devise:install from "."
           TODO  rails generate devise MODEL

The recipe for devise looks like:

    class Devise < RailsRecipe
      gem 'devise'
      bundle
      generate 'devise:install'
      todo 'rails generate devise MODEL'
    end


Available Recipes
=================

You can browse the recipe library on GitHub: https://github.com/bonsaiben/bently/tree/master/lib/bently/recipe


License
-------
Released under the MIT License.  See the [LICENSE][] file for further details.

[license]: LICENSE
