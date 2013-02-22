module Bently

  class Step
    def initialize(*args)
    end
    def question; nil end
    def fail_on_skip?; false end
  end

  class StepShell < Step
    attr_reader :command
    def initialize(*args)
      @command = args.shift
      @options = args.first || {}
    end
    def action; @options[:action] || 'execute' end
    def question; @options[:ask] end
    def description
      return @options[:description] if @options[:description]
      command_desc = command
      if command_desc.is_a?(Proc)
        placeholder = '...'
        command_desc = command_desc.call(placeholder)
      end
      "Execute:\n#{command_desc}"
    end
    def fail_on_skip?; @options[:fail_on_skip] end
  end

  class StepTouch < Step
    attr_reader :file, :data
    def initialize(*args)
      opts = args.first
      @file, @data = [:file,:with].map{|k| opts[k]}
    end
    def action; 'touch' end
    def description; "Touch #{file}:\n#{data}" end
  end

  class StepModify < Step
    attr_reader :file, :pattern, :replacement
    def initialize(*args)
      opts = args.first
      @file, @pattern, @replacement = [:file,:from,:to].map{|k| opts[k]}
    end
    def action; 'modify' end
    def description
      "Modify #{file}:\n#{pattern.inspect} =>\n#{replacement}"
    end
  end

  class StepAppend < Step
    attr_reader :file, :data
    def initialize(*args)
      opts = args.first
      @file, @data = [:file,:with].map{|k| opts[k]}
    end
    def action; 'append' end
    def description; "Append to #{file}:\n#{data}" end
  end

  class StepPrepend < Step
    attr_reader :file, :data
    def initialize(*args)
      opts = args.first
      @file, @data = [:file,:with].map{|k| opts[k]}
    end
    def action; 'prepend' end
    def description; "Prepend to #{file}:\n#{data}" end
  end

  class StepInsert < Step
    attr_reader :file, :data, :options
    def initialize(*args)
      opts = args.first
      @file, @data = [:file,:with].map{|k| opts.delete(k) }
      @options = opts
    end
    def action; 'insert' end
    def description; "Insert into #{file}:\n#{data}" end
  end

  class StepRemove < Step
    attr_reader :file
    def initialize(*args)
      opts = args.first
      @file = opts.delete(:file)
    end
    def action; 'remove' end
    def description; "Remove #{file}" end
  end

end
