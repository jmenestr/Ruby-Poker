class Card
  include Comparable

  CARD_VALUES = {
    two: 2,
    three: 3,
    four: 4,
    five: 5,
    six: 6,
    seven: 7,
    eight: 8,
    nine: 9,
    ten: 10,
    jack: 11,
    queen: 12,
    king: 13,
    ace: 14

  }

  attr_reader :face, :suit



  def initialize(face, suit)#raise error if face not in hash
    @face = face
    @suit = suit
  end

  def value
    CARD_VALUES[face]
  end

  def <=>(other_card)
    value <=> other_card.value
  end


end
