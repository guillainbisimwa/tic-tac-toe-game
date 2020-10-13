=begin
This class is only for testing
length for given string and return the size
=end
class Message
  attr_accessor :info
  attr_reader :from, :to
  def initialize; end

  def name_length?(from, to)
    @info.size < from || @info.size > to
  end

  def valid_symbols?(symb)
    return true if symb == 'o' || symb == 'x'
    false
  end

  def valid_nbr_from_board?(nbr, from, to)
    nbr >= from && nbr <= to
  end
end
