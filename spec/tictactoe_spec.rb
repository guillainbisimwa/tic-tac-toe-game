require './lib/game_logic'

describe Message do
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
end
