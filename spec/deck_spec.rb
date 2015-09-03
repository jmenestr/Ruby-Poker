require 'rspec'
require 'deck'

describe Deck do

  context 'creating a new deck' do
    describe '::create_cards' do
      subject(:deck) {Deck.create_cards}

      it 'returns a deck with 52 cards' do
        expect(deck.count).to eq 52
      end
    end
  end

  subject(:deck) { Deck.new }

  describe '#draw' do
    before(:each) { deck.draw }
    it 'draw takes one card from the deck' do
      expect(deck.cards.count).to eq(51)
    end
  end




end
