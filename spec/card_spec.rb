require 'card'
require 'rspec'



describe Card do

  subject(:card)  { Card.new(:king, :hearts) }

  describe '#value' do
    it 'return card value' do
      expect(card.value).to eq(13)
    end
  end

  describe '#face' do
    it 'returns face of card' do
      expect(card.face).to eq(:king)
    end
  end

  describe '#suit' do
    it 'returns suit of card' do
      expect(card.suit).to eq(:hearts)
    end
  end

  

end
