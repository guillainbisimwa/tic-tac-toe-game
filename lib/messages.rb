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

  def valid_nbr_from_board?(nbr, from, to, array)
    [nbr >= from && nbr <= to, array.any?(nbr)]
  end
end

class String
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

class GameLogic
  attr_accessor :p_1, :p_2, :p_1_symb, :p_2_symb

  def initialize; end

  def u_entry(player_msg)
    puts player_msg.to_s
    player = gets.chomp
    player
  end

  def compare_user_entry?
    @p_1 == @p_2
  end

  def move(table, choice, symb)
    table[table.index(choice)] = symb
    table
  end

  def h_win(symb, table)
    i = 0
    while i < table.size
      if (symb == table[i]) &&
         (table[i] == table[i + 1] && table[i] == table[i + 2]) ||
         i.zero? && table[i] == table[i + 4] && table[i] == table[i + 8]
        return true
      end

      i += 3
    end

    (0..2).each do |nbr|
      if symb == table[nbr] &&
         (table[nbr] == table[nbr + 3] &&
         table[nbr] == table[nbr + 6]) ||
         nbr == 2 && table[nbr] == table[nbr + 2] && table[nbr] == table[nbr + 4]
        return true
      end
    end

    false
  end

  def draw(tab)
    return true if tab.none?(Integer)

    false
  end
end
