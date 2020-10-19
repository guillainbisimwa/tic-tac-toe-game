require './lib/game_logic'

describe Message do
  let(:arr) { [1, 2, 3, 4, 6, 7, 8, 9] }
  let(:arr_playing) { [1, 2, 3, 'x', 6, 7, 'o', 9] }
  let(:arr_draw) { ['x', 'x', 'o', 'o', 'x', 'o', 'x', 'o'] }

  context 'name_length?' do
    it 'Testing the length of a name' do
      m = Message.new
      m.info = 'Martin'
      expect(m.name_length?(3, 10)).to eql(false)
    end

    it 'Testing the length of a name' do
      m = Message.new
      m.info = 'Ma'
      expect(m.name_length?(3, 10)).to eql(true)
    end
  end

  context 'valid_symbols?' do
    it "Test if the symbol is 'o' or 'x'" do
      m = Message.new
      expect(m.valid_symbols?('x')).to eql(true)
    end

    it "Test if the symbol is 'o' or 'x'" do
      m = Message.new
      expect(m.valid_symbols?('a')).to eql(false)
    end

    it "Test if the symbol is 'o' or 'x'" do
      m = Message.new
      expect(m.valid_symbols?('o')).to eql(true)
    end
  end

  context 'valid_nbr_from_board' do
    it 'Check if a number is from 1 to 9 and exists in the array' do
      m = Message.new
      expect(m.valid_nbr_from_board?(1, 1, 9, arr)).to eql([true, true])
    end

    it 'Check if a number is from 1 to 9 and exists in the array' do
      m = Message.new
      expect(m.valid_nbr_from_board?(0, 1, 9, arr)).to eql([false, false])
    end
  end

end
