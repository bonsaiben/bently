module Bently
  class Recipe

    class Operation
      def say; nil end
      def after; nil end
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
      def after
        @data.each_line.each_with_index.map{|l,i| [i+1, l] }
      end
    end

    class Modify < Operation
      attr_reader :args, :file, :pattern, :replace
      def initialize *args
        @file, @pattern, @replace = @args = args
      end
      def after
        [[1,@pattern.inspect], [2,@replace.inspect]]
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
      def after
        @data.each_line.each_with_index.map{|l,i| [i+1, l] }
      end
    end

    class Insert < Operation
      attr_reader :args, :file, :data, :options
      def initialize *args
        @file, @data, @options = @args = args
      end
      def after
        @data.each_line.each_with_index.map{|l,i| [i+1, l] }
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

    def self.title(n) @title ||= n; end
    def self.category(category) @category ||= category; end
    def self.description(description) @description ||= description; end
    def self.homepage(homepage=nil) @homepage ||= homepage; end
    def self.version(version) @version ||= version; end

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
    def todo(name)    ; say(name, 'TODO', :red) end
    def warn(text)    ; say(text, 'WARNING', :red) end
    def requirement(text)     ; say(text, 'REQUIRED', :red) end
    def usage(text)     ; say(text, 'USAGE', :red) end

    protected

    def template name
      f = "#{BENTLY_REPOSITORY}/lib/bently/template/#{file_name}/#{name}"
      File.read(f)
    end

    def file_name
      string = self.class.instance_method(:initialize).source_location[0]
      string = string.split('/').last.split('.').first
    end
  end
end
