require './lib/game_logic'

describe Message do
  let(:message) {Message.new}
  let(:game_logic) {GameLogic.new}
  let(:arr) { [1, 2, 3, 4, 5, 6, 7, 8, 9] }
  let(:arr_playing) { [1, 2, 3, 4, 5, 6, 7, 'o', 9] }
  let(:arr_first_moved_x) { ['x', 2, 3, 4, 5, 6, 7, 8, 9] }
  let(:arr_last_win) { %w[x o x o x x o o o] }
  let(:arr_draw) { %w[x o x o x o x o o] }

  context 'name_length?' do
    it 'Testing the length of a name' do
      message.info = 'Martin'
      expect(message.name_length?(3, 10)).to eql(false)
    end

    it 'Testing the length of a name' do
      message.info = 'Ma'
      expect(message.name_length?(3, 10)).to eql(true)
    end
  end

  context 'valid_symbols?' do
    it "Test if the symbol is 'o' or 'x'" do
      expect(message.valid_symbols?('x')).to eql(true)
    end

    it "Test if the symbol is 'o' or 'x'" do
      expect(message.valid_symbols?('a')).to eql(false)
    end

    it "Test if the symbol is 'o' or 'x'" do
      expect(message.valid_symbols?('o')).to eql(true)
    end
  end

  context 'valid_nbr_from_board' do
    it 'Check if a number is from 1 to 9 and exists in the array' do
      expect(message.valid_nbr_from_board?(1, 1, 9, arr)).to eql([true, true])
    end

    it 'Check if a number is from 1 to 9 and exists in the array' do
      expect(message.valid_nbr_from_board?(0, 1, 9, arr)).to eql([false, false])
    end
  end

  context 'Compare two names' do
    it 'compare the user entry' do
      game_logic.p_1 = 'Martin'
      game_logic.p_2 = 'Kingsley'
      expect(game_logic.compare_user_entry?).to eql(false)
    end

    it 'compare the user entry' do
      game_logic.p_1 = 'Martin'
      game_logic.p_2 = 'Martin'
      expect(game_logic.compare_user_entry?).to eql(true)
    end
  end

  context 'Make a move' do
    it 'Test the first player move' do
      expect(game_logic.move(arr, 1, 'x')).to eql(arr_first_moved_x)
    end

    it 'Test the invalid move' do
      expect(game_logic.move(arr, 8, 'o')).to eql(arr_playing)
    end
  end

  context 'Test if there is a winner or not' do
    it 'No winner' do
      expect(game_logic.h_win('x', arr)).to eql(false)
    end

    it 'There is a winner' do
      expect(game_logic.h_win('o', arr_last_win)).to eql(true)
    end
  end

  context 'Check if the game id tie' do
    it 'Check if there is a draw' do
      expect(game_logic.draw(arr)).to eql(false)
    end

    it 'Check if there is a draw' do
      expect(game_logic.draw(arr_draw)).to eql(true)
    end
  end
end
