require 'bently'
require 'stringio'
 
module Kernel
 
  def capture_stdout
    out = StringIO.new
    $stdout = out
    yield
    return out
  ensure
    $stdout = STDOUT
  end
 
end


class String
  def blank?; self=='' end
end

class NilClass
  def blank?; true end
end
