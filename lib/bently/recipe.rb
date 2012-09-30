module Bently
  
  module RecipeMethods
    def self.extended(base)
      base.send(:include, InstanceMethods) if base.is_a? Class
    end

    def step(*args)
      step_args << args
    end

    def step_args
      @steps_args ||= []
    end

    private

    def inherited(subclass)
      super
      subclass.step_args.concat self.step_args
    end

    module InstanceMethods
      def steps
        @steps ||= parse_steps
      end

      protected

      def parse_steps
        self.class.step_args.map do |args|
          self.send(args.shift, *args)
        end
      end
    end
  end

  class Recipe
    extend RecipeMethods

    # step :shell, command
    def shell(*args); StepShell.new(*args) end

    # step :touch, :file => filename, :with => data
    def touch(*args) StepTouch.new(*args) end

    # step :modify, :file => filename, :from => pattern, :to => replacement
    def modify(*args) StepModify.new(*args) end

    # step :append, :file => filename, :with => data
    def append(*args) StepAppend.new(*args) end

    # step :prepend, :file => filename, :with => data
    def prepend(*args) StepPrepend.new(*args) end

    # step :insert, :file => filename, :with => data, :after => some_text
    def insert(*args) StepInsert.new(*args) end

    # step :remove, :file => filename
    def remove(*args) StepRemove.new(*args) end
  end

end
