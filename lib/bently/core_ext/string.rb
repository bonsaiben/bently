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

    def constantize
      names = self.split('::')
      names.shift if names.empty? || names.first.empty?

      names.inject(Object) do |constant, name|
        if constant == Object
          constant.const_get(name)
        else
          candidate = constant.const_get(name)
          next candidate if constant.const_defined?(name, false)
          next candidate unless Object.const_defined?(name)

          # Go down the ancestors to check it it's owned
          # directly before we reach Object or the end of ancestors.
          constant = constant.ancestors.inject do |const, ancestor|
            break const    if ancestor == Object
            break ancestor if ancestor.const_defined?(name, false)
            const
          end

          # owner is in Object, so raise
          constant.const_get(name, false)
        end
      end
    end

end
