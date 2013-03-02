class Recipe

  class Operation
    def say; nil end
  end

  class Say < Operation
    attr_reader :message, :status, :color
    def initialize *args
      @message, @status, @color = args
    end
    def args
      @status ? [@status,@message,@color] : [@status]
    end
  end

  class Run < Operation
    attr_reader :command
    def initialize *args
      @command = args.shift
    end
  end

  class Create < Operation
    attr_reader :args, :file, :data
    def initialize *args
      @file, @data = @args = args
    end
  end

  class Modify < Operation
    attr_reader :args, :file, :pattern, :replace
    def initialize *args
      @file, @pattern, @replace = @args = args
    end
  end

  class Append < Operation
    attr_reader :file, :data
    def initialize *args
      @file, @data = args
    end
    def args; [@file, @data] end
    def after
      @data.each_line.each_with_index.map{|l,i| [i+1, l] }
    end
  end

  class Prepend < Operation
    attr_reader :args, :file, :data
    def initialize *args
      @file, @data = @args = args
    end
  end

  class Insert < Operation
    attr_reader :args, :file, :data, :options
    def initialize *args
      @file, @data, @options = @args = args
    end
  end

  class Remove < Operation
    attr_reader :args, :file
    def initialize *args
      @args = args
      @file = @args[0]
    end
  end

  def self.breakdown
    new.operations
  end

  def self.name(name) @name = name; end
  def self.category(category) @category = category; end
  def self.description(description) @description = description; end
  def self.homepage(homepage) @homepage = homepage; end
  def self.version(version) @version = version; end

  def operations; @operations ||= []; end

  def say(*args)     ; operations << Say.new(*args) end
  def run(*args)     ; operations << Run.new(*args) end
  def create(*args)  ; operations << Create.new(*args) end
  def modify(*args)  ; operations << Modify.new(*args) end
  def append(*args)  ; operations << Append.new(*args) end
  def prepend(*args) ; operations << Prepend.new(*args) end
  def insert(*args)  ; operations << Insert.new(*args) end
  def remove(*args)  ; operations << Remove.new(*args) end
  def operate(op, *args) ; operations << op.new(*args) end
  def todo(name)    ; say;say(name, 'TODO', :red) end
end
