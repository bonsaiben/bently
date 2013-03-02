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
    def bake recipe
      recipe = RecipeBook.find(recipe).new
      exec recipe
    end

    protected

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
