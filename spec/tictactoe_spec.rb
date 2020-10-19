require './lib/game_logic'

describe Calculator do
  describe 'Testing' do
    it 'Test' do
      m = Message.new
      expect(m.valid_symbols?('x')).to eql(true)
    end
  end
end
