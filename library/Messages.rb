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
    return true if symb.to_s == 'o' || symb.to_s == 'x'

    false
  end

  # Return two boolean,
  # The first boolean is true if the nbr is in range from 1 to 9
  # The second boolean is true if the nbr is not taken (is in the array)
  def valid_nbr_from_board?(nbr, from, to, array)
    [nbr >= from && nbr <= to, array.any?(nbr)]
  end
end
