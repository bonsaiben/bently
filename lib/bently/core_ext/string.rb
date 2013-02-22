# some methods borrowed from ActiveSupport
# https://github.com/rails/rails/tree/master/activesupport
# MIT License (http://www.opensource.org/licenses/MIT)

class String

    def camelize
      string = self
      string = string.sub(/^[a-z\d]*/) { $&.capitalize }
      string = string.gsub(/\-/,'_')
      string.gsub(/(?:_|(\/))([a-z\d]*)/i) { "#{$1}#{$2.capitalize}" }.gsub('/', '::')
    end

    if Module.method(:const_get).arity == 1
      def constantize
        names = self.split('::')
        names.shift if names.empty? || names.first.empty?

        constant = Object
        names.each do |name|
          constant = constant.const_defined?(name) ? constant.const_get(name) : constant.const_missing(name)
        end
        constant
      end
    else
      def constantize
        names = self.split('::')
        names.shift if names.empty? || names.first.empty?

        constant = Object
        names.each do |name|
          constant = constant.const_defined?(name, false) ? constant.const_get(name) : constant.const_missing(name)
        end
        constant
      end
    end

end
