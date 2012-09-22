module Bently

  class Recipe
    
    BUNDLE_INSTALL = "bundle install"
    RECIPE_DIR = "#{BENTLY_REPOSITORY}/lib/bently/recipe/*.rb"

    def initialize options={}
      @read_only = options[:read_only]
    end

    def self.list
      Dir[RECIPE_DIR].map{ |f| File.basename f, '.rb' }.sort
    end

    def self.from_name name
      "Bently::#{name.camelize}".constantize
    end



    def bake
      puts_step "Done!"
    end


    protected

    def cli
      @cli ||= CLI.new
    end

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
  
    def bundle_install
      command BUNDLE_INSTALL
    end

    def command cmd
      unless @read_only
        puts `#{cmd}` if confirm_step cmd
      else
        puts_step cmd
      end
    end

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

    def create_file destination, data
      unless @read_only
        cli.create_file destination, data if confirm_step "Touch #{destination}"
      else
        puts_quote_step "Touch #{destination}", data
      end
    end

    def gsub_file file, search, replace
      unless @read_only
        if confirm_step "Edit #{file}"
          cli.gsub_file file, search, replace
        end
      else
        puts_step "Edit #{file}"
      end
    end

    def puts_quote_step text, quote
      puts_step "#{text}"
      puts
      puts "#{quote}"
      puts
    end

    def confirm_step text
      cli.yes? "#{magenta('==>')} #{bold(text)}?"
    end

    def puts_step text
      puts "#{magenta('==>')} #{bold(text)}"
    end

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

Dir["#{Bently::BENTLY_REPOSITORY}/lib/bently/recipe/*.rb"].map{ |f| File.basename f, '.rb' }.each do |f|
  require 'bently/recipe/' + f
end
