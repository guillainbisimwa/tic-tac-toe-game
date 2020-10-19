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
end
