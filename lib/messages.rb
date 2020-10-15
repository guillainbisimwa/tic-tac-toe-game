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

class TicTacToe
  attr_accessor :p_1, :p_2, :p_1_symb, :p_2_symb

  def initialize; end

  # This method Set players names and symbols
  def u_entry(player_msg)
    puts player_msg.to_s
    player = gets.chomp
    player
  end

  # Check if name or symbol is already taken
  def compare_user_entry?
    @p_1 == @p_2
  end

  # This method draw the board for the game
  def board(table)
    i = 0
    while i < table.size
      puts '+---+---+---+'
      puts "| #{table[i]} | #{table[i + 1]} | #{table[i + 2]} |"
      i += 3
    end
    puts '+---+---+---+'
  end

  # This method return a modified array,
  # places the symbols and valid an user's move
  def move(table, choice, symb)
    table[table.index(choice)] = symb
    table
  end

  # This method check if the game is draw
  def won
    false
  end

  def h_win(p_1, p_1_symb, table)
    i = 0
    while i < table.size
      if (p_1_symb == table[i]) &&
         (table[i] == table[i + 1] && table[i] == table[i + 2]) ||
         i.zero? && table[i] == table[i + 4] && table[i] == table[i + 8]
        puts "Congratulations #{p_1.red}, you win the game!".green
      end
      i += 3
    end
    !won
  end

  # This method check if the game is draw
  def draw(tab)
    if tab.none?(Integer)
      puts 'The game is tie, play again'
      true
    else
      false
    end
  end
end