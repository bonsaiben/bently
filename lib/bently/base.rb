module Bently

  class Base < Thor
    include Thor::Actions

    desc 'list', 'list recipes'
    def list
      RecipeBook.all.each {|f| puts f }
    end

    desc 'read [RECIPE]', 'display a recipe'
    method_options :pretend => true
    def read recipe
      recipe = RecipeBook.find(recipe)
      exec recipe
    end

    desc 'bake [RECIPE]', 'execute a recipe'
    method_option :step, :default => false, :type => :boolean, :desc => "step through the recipe and prompt before executing each operation"
    def bake recipe
      recipe = RecipeBook.find(recipe)
      if options['step']
        step recipe
      else
        exec recipe
      end
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
        op.after.each{|s,t| say_status s, t, :magenta }
      when Recipe::Prepend
        create_file op.file unless File.exists? op.file
        prepend_to_file *op.args
      when Recipe::Insert
        insert_into_file *op.args
      when Recipe::Remove
        remove_file *op.args
      end
    end

    #def confirmed_step? step
    #  yes? tab(magenta("#{step.action}?"))
    #end

    #def cancel_step
    #  puts red(tab('skipped'))
    #end

  end

end
