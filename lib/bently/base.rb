module Bently

  class Base < Thor
    include Thor::Actions

    desc 'list [STRING]', 'list recipes'
    def list str=nil
      recipes = Recipebook.all
      recipes = recipes.select{|r| r =~ /#{str}/ } if str
      recipes.each {|f| puts f }
    end

    desc 'read [RECIPE]', 'display a recipe'
    method_options :pretend => true
    def read recipe
      recipe = Recipebook.find(recipe)
      exec recipe
    end

    desc 'bake [RECIPE]', 'execute a recipe'
    method_option :step, :default => false, :type => :boolean, :desc => "step through the recipe and prompt before executing each operation"
    def bake recipe
      recipe = Recipebook.find(recipe)
      if options['step']
        step recipe
      else
        exec recipe
      end
    end

    desc 'source [RECIPE]', 'print the URL for the source of the instructions contained in the recipe'
    def source recipe
      recipe = Recipebook.find(recipe)
      puts recipe.homepage
    end


    protected

    def step recipe
      recipe.breakdown.each do |op|
        pretendly { run_operation op }
        a = ask("Perform this operation [y,n,q]?").downcase
        exit if a == 'q'
        if a == 'y'
          quietly { run_operation op }
        end
      end
    end

    def pretendly
      set_option :pretend, true
      yield
      set_option :pretend, false
    end

    def quietly
      set_option :quiet, true
      yield
      set_option :quiet, false
    end

    def set_option option, val
      self.options = self.options.merge(option => val)
    end

    def exec recipe
      recipe.breakdown.each do |op|
        run_operation op
      end
    end

    def run_operation op
      case op
      when Recipe::Say
        op.status ? say_status(*op.args) : say(*op.args)
      when Recipe::Run
        run op.command
      when Recipe::Create
        create_file *op.args
      when Recipe::Modify
        gsub_file *op.args
      when Recipe::Append
        create_file op.file unless File.exists? op.file
        say_status *op.say if op.say
        append_to_file *op.args
      when Recipe::Prepend
        create_file op.file unless File.exists? op.file
        prepend_to_file *op.args
      when Recipe::Insert
        insert_into_file *op.args
      when Recipe::Remove
        remove_file *op.args
      end
      op.after.each{|s,t| say_status s, t, :magenta } if op.after
    end

    #def confirmed_step? step
    #  yes? tab(magenta("#{step.action}?"))
    #end

    #def cancel_step
    #  puts red(tab('skipped'))
    #end

  end

end
