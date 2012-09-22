module Bently

  class Recipe
    
    BUNDLE_INSTALL = "bundle install"
    RECIPE_DIR = "#{BENTLY_REPOSITORY}/lib/bently/recipe/*.rb"

    # list all recipes
    def self.list
      Dir[RECIPE_DIR].map{ |f| File.basename f, '.rb' }.sort
    end

    # get recipe class from name
    def self.from_name name
      "Bently::#{name.camelize}".constantize
    end



    def initialize options={}
      @read_only = options[:read_only]
    end

    # bake a recipe
    def bake
      puts_step "Done!"
    end

  protected

    # instance to CLI
    # for access to Thor helper methods
    def cli; @cli ||= CLI.new end

    # add a gem to the Gemfile
    def add_gem gem_def
      unless @read_only
        if confirm_step "Add to Gemfile"
          begin
            cli.append_to_file 'Gemfile', gem_def
          rescue
            puts "Gemfile was not found. Aborting.."
            return false
          end
        end
      else
        puts_quote_step "Add to Gemfile", gem_def
      end
      true
    end

    # run bundle install
    def bundle_install
      command BUNDLE_INSTALL
    end

    # execute a command
    def command cmd
      unless @read_only
        puts `#{cmd}` if confirm_step cmd
      else
        puts_step cmd
      end
    end

    # executes a command with user input
    def ask_command cmd, prompt
      unless @read_only
        if confirm_step cmd
          resp = cli.ask prompt
          puts `#{yield resp}`
        end
      else
        puts_step cmd
      end
    end

    # creates a file
    def create_file destination, data
      unless @read_only
        cli.create_file destination, data if confirm_step "Touch #{destination}"
      else
        puts_quote_step "Touch #{destination}", data
      end
    end

    # gsubs a file
    def gsub_file file, search, replace
      unless @read_only
        if confirm_step "Edit #{file}"
          cli.gsub_file file, search, replace
        end
      else
        puts_step "Edit #{file}"
      end
    end

    # outputs a step with a blockquote
    def puts_quote_step text, quote
      puts_step "#{text}"
      puts
      puts "#{quote}"
      puts
    end

    # outputs a step for confirmation
    def confirm_step text
      cli.yes? "#{magenta('==>')} #{bold(text)}?"
    end

    # outputs a step
    def puts_step text
      puts "#{magenta('==>')} #{bold(text)}"
    end

    # colorizes text
    def colorize(text, color_code)
      "#{color_code}#{text}\033[0m"
    end

    def red(text); colorize(text, "\033[31m"); end
    def green(text); colorize(text, "\033[32m"); end
    def magenta(text); colorize(text, "\033[35m"); end
    def light_green(text); colorize(text, "\033[32m"); end
    def bold(text); "\033[1m#{text}\033[22m"; end

  end
end

# load recipes
Dir["#{Bently::BENTLY_REPOSITORY}/lib/bently/recipe/*.rb"].map{ |f| File.basename f, '.rb' }.each do |f|
  require 'bently/recipe/' + f
end
