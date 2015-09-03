require_relative 'card'

class Deck

  SUITS = [:hearts, :diamonds, :clubs, :spades]
  FACES = [:two, :three, :four, :five, :six, :seven, :eight, :nine, :ten, :jack, :queen, :king, :ace]

  def self.create_cards
    deck = []

    SUITS.each do |suit|
      FACES.each do |face|
        deck << Card.new(face, suit)
      end
    end

    deck.shuffle
  end

  attr_reader :cards

  def initialize(cards = Deck.create_cards)
    @cards = cards
  end

  def draw
    cards.pop
  end






end
