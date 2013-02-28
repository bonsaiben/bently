require 'recipe'
class RubyRecipe < Recipe
  GEMFILE = 'Gemfile'

  class Gem < Append
    def initialize *args
      super
      @name = args[2]
    end
    def say; ['gemfile',@name] end
    def args; [@file, @data, verbose: false] end
  end

  def gem(*args)
    options = args.last.is_a?(Hash) ? args.pop : {}
    name, version = args

    # Set the message to be shown in logs. Uses the git repo if one is given,
    # otherwise use name (version).
    parts, message = [ name.inspect ], name
    if version ||= options.delete(:version)
      parts   << version.inspect
      message << " (#{version})"
    end
    message = options[:git] if options[:git]

    options.each do |option, value|
      parts << "#{option}: #{value.inspect}"
    end

    str = "gem #{parts.join(", ")}"
    str = "  " + str if @in_group
    str = "\n" + str

    if @in_group
      @gems = @gems.to_s + str
    else
      operate Gem, GEMFILE, str, message
    end
  end

  def gem_group(*names, &block)
    name = names.map(&:inspect).join(", ")

    str = "\ngroup #{name} do"

    @in_group = true
    instance_eval(&block)
    @in_group = false

    str += @gems
    str += "\nend\n"

    operate Gem, GEMFILE, str
  end

  def bundle
    run 'bundle install'
  end

end
