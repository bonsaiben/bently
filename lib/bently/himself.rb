module Bently

  class Himself < Thor
    include Thor::Actions
    include CLO

    desc 'list', 'list recipes'
    def list
      RecipeBook.all.each {|f| puts f }
    end

    desc 'read [RECIPE]', 'display a recipe'
    def read recipe
      recipe = RecipeBook.find(recipe).new
      recipe.steps.each_with_index do |step,i|
        read_step step, i+1
      end
    end

    desc 'bake [RECIPE]', 'execute a recipe'
    def bake recipe
      recipe = RecipeBook.find(recipe).new
      recipe.steps.each_with_index do |step,i|
        read_step step, i+1
        if confirmed_step? step
          bake_step step
        else
          cancel_step
          exit if step.fail_on_skip?
        end
      end
    end

    protected

    def read_step step, num
      text = step.description.split("\n")
      listout text.shift, num
      blockquote text if text.any?
    end

    def confirmed_step? step
      yes? tab(magenta("#{step.action}?"))
    end

    def cancel_step
      puts red(tab('skipped'))
    end

    def bake_step step
      if step.is_a?(StepShell)
        execute step
      elsif step.is_a?(StepTouch)
        touch step
      elsif step.is_a?(StepModify)
        modify step
      elsif step.is_a?(StepAppend)
        append step
      elsif step.is_a?(StepPrepend)
        prepend step
      elsif step.is_a?(StepInsert)
        insert step
      elsif step.is_a?(StepRemove)
        remove step
      end
    end

    def execute step
      command = step.command
      if command.is_a?(Proc)
        resp = ask(tab(magenta(step.question)))
        command = command.call(resp)
      end
      puts `#{command}`
    end

    def touch step
      create_file(step.file, step.data)
    end

    def modify step
      gsub_file step.file, step.pattern, step.replacement
    end

    def append step
      create_file(step.file) unless File.exists? step.file
      append_to_file step.file, "#{step.data}\n"
    end

    def prepend step
      create_file(step.file) unless File.exists? step.file
      prepend_to_file step.file, "\n#{step.data}"
    end

    def insert step
      insert_into_file step.file, step.data, step.options
    end

    def remove step
      remove_file step.file
    end

  end

end
