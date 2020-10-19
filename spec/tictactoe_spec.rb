require './lib/game_logic'

describe Message do
  let(:arr) { [1, 2, 3, 4, 5, 6, 7, 8, 9] }
  let(:arr_playing) { [1, 2, 3, 4, 5, 6, 7, 'o', 9] }
  let(:arr_draw) { %w[x x o o x x o o] }
  let(:arr_first_moved_x) { ['x', 2, 3, 4, 5, 6, 7, 8, 9] }
  let(:arr_last_win) { ['x', 'o', 'x', 'x', 'x', 'x', 'o', 'o', 'o'] }
  let(:arr_last_move_win) { ['x', 'o', 'x', 'x', 'x', 'x', 'o', 8, 'o'] }

  context 'name_length?' do
    it 'Testing the length of a name' do
      message = Message.new
      message.info = 'Martin'
      expect(message.name_length?(3, 10)).to eql(false)
    end

    it 'Testing the length of a name' do
      message = Message.new
      message.info = 'Ma'
      expect(message.name_length?(3, 10)).to eql(true)
    end
  end

  context 'valid_symbols?' do
    it "Test if the symbol is 'o' or 'x'" do
      message = Message.new
      expect(message.valid_symbols?('x')).to eql(true)
    end

    it "Test if the symbol is 'o' or 'x'" do
      message = Message.new
      expect(message.valid_symbols?('a')).to eql(false)
    end

    it "Test if the symbol is 'o' or 'x'" do
      message = Message.new
      expect(message.valid_symbols?('o')).to eql(true)
    end
  end

  context 'valid_nbr_from_board' do
    it 'Check if a number is from 1 to 9 and exists in the array' do
      message = Message.new
      expect(message.valid_nbr_from_board?(1, 1, 9, arr)).to eql([true, true])
    end

    it 'Check if a number is from 1 to 9 and exists in the array' do
      message = Message.new
      expect(message.valid_nbr_from_board?(0, 1, 9, arr)).to eql([false, false])
    end
  end

  context 'Compare two names' do
    it 'compare_user_entry' do
      game_logic = GameLogic.new
      game_logic.p_1 = 'Martin'
      game_logic.p_2 = 'Kingsley'
      expect(game_logic.compare_user_entry?).to eql(false)
    end

    it 'compare_user_entry' do
      game_logic = GameLogic.new
      game_logic.p_1 = 'Martin'
      game_logic.p_2 = 'Martin'
      expect(game_logic.compare_user_entry?).to eql(true)
    end
  end

  context 'Make a move' do
    it 'Test the first player move' do
      game_logic = GameLogic.new
      expect(game_logic.move(arr, 1, 'x')).to eql(arr_first_moved_x)
    end

    it 'Test the invalid move' do
      game_logic = GameLogic.new
      expect(game_logic.move(arr, 8, 'o')).to eql(arr_playing)
    end
  end

  context 'Test if there is a winner or not' do
    it 'No winner' do
      game_logic = GameLogic.new
      expect(game_logic.h_win('x', arr)).to eql(false)
    end

    it 'There is a winner' do
      game_logic = GameLogic.new
      expect(game_logic.h_win('o', arr_last_win)).to eql(true)
    end
  end
end
