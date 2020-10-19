require './lib/game_logic'

describe Message do
  let(:arr) { [1, 2, 3, 4, 6, 7, 8, 9] }
  let(:arr_playing) { [1, 2, 3, 'x', 6, 7, 'o', 9] }
  let(:arr_draw) { ['x', 'x', 'o', 'o', 'x', 'o', 'x', 'o'] }

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

  context '' do
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

end
