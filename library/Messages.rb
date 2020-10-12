=begin
This class is only for testing
length for given string and return the size
=end
class Message
  attr_reader :info, :from, :to
  def initialize(info)
    @info = info
  end
  def name_length?(from, to)
    @info.size < from || @info.size > to
  end

end