Bently is a tool for packaging and executing small sets of prescribed commands and operations with one command, in a Ruby environment.

You can think of it as a mini Homebrew for installing and configuring Ruby gems. It can also be used simply as a reminder/reference tool for commands you want to remember.

I wrote it primarily for rapid prototyping in Rails, but it can be used for any kind of command line or file operation.

For example, I start a new project that needs user authentication so I want to use Devise.
Looking at the Devise README on GitHub I find the necessary steps for installing and configuring Devise.

    add "gem 'devise'" to Gemfile
    bundle install
    rails g devise:install
    rails g devise user

As a Bently recipe, this becomes:

    bently bake devise
    
Or if I just want a readout without executing:

    bently read devise

Fork and accumulate your own collection of recipes.