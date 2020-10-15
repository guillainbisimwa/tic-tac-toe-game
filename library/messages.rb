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

class String
  # colorization
  def colorize(color_code)
    "\e[#{color_code}m#{self}\e[0m"
  end

  def red
    colorize(31)
  end

  def green
    colorize(32)
  end

  def yellow
    colorize(33)
  end

  def blue
    colorize(34)
  end

  def pink
    colorize(35)
  end

  def light_blue
    colorize(36)
  end
end
