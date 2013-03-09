# (The MIT License) 
# 
# Copyright (c) 2011 John Mair (banisterfiend)
# 
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# 'Software'), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
# 
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
# IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
# CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
# TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
# SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


if RUBY_VERSION == '1.8.7'
  class Method
    def trace_func(event, file, line, id, binding, classname)
      return unless event == 'call'
      set_trace_func nil

      @file, @line = file, line
      raise :found
    end

    private :trace_func

    # Return the source location of a method for Ruby 1.8.
    # @return [Array] A two element array. First element is the
    #   file, second element is the line in the file where the
    #   method definition is found.
    def source_location
      if @file.nil?
        args =[*(1..(arity<-1 ? -arity-1 : arity ))]

        set_trace_func method(:trace_func).to_proc
        call(*args) rescue nil
        set_trace_func nil
        @file = File.expand_path(@file) if @file && File.exist?(File.expand_path(@file))
      end
      [@file, @line] if @file
    end
  end


  class UnboundMethod
    # Return the source location of an instance method for Ruby 1.8.
    # @return [Array] A two element array. First element is the
    #   file, second element is the line in the file where the
    #   method definition is found.
    def source_location
      klass = case owner
              when Class
                owner
              when Module
                method_owner = owner
                Class.new { include(method_owner) }
              end

      # deal with immediate values
      case
      when klass == Symbol
        return :a.method(name).source_location
      when klass == Fixnum
        return 0.method(name).source_location
      when klass == TrueClass
        return true.method(name).source_location
      when klass == FalseClass
        return false.method(name).source_location
      when klass == NilClass
        return nil.method(name).source_location
      end

      begin
        Object.instance_method(:method).bind(klass.allocate).call(name).source_location
      rescue TypeError

        # Assume we are dealing with a Singleton Class:
        # 1. Get the instance object
        # 2. Forward the source_location lookup to the instance
        instance ||= ObjectSpace.each_object(owner).first
        Object.instance_method(:method).bind(instance).call(name).source_location
      end
    end
  end
end
