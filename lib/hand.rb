require 'byebug'
class Hand

  attr_reader :hand
  attr_accessor :score

  HANDS = {
    pair: 2,
    two_pair: 3,
    three_of_a_kind: 4,
    straight: 5,
    flush: 6,
    full_house: 7,
    four_of_a_kind: 8,
    straight_flush: 9,
    royal_flush: 10
  }

  def initialize(hand = [])
    @hand = hand
  end

  def discard(rejected_card)
    hand.reject! { |card| card == rejected_card }
  end

  def add_card(card)
    hand << card
  end

  def calculate_hand
    value = 1
    HANDS.keys.reverse.each do |type_of_hand|
      method_name = type_of_hand.to_s + "?"
      if self.send(method_name)
        value = HANDS[type_of_hand]
        break
      end
    end
    value
  end

  def winning_hand?(other_hand)
    if tied?(other_hand) || calculate_hand < other_hand.calculate_hand
      return false
    elsif calculate_hand > other_hand.calculate_hand
      return true
    elsif calculate_hand == other_hand.calculate_hand
      max_card_value > other_hand.max_card_value
    end
  end

  def tied?(other_hand)
    calculate_hand == other_hand.calculate_hand &&
      max_card_value == other_hand.max_card_value
  end

  def max_card_value
    values = hand.map { |card| card.value }
    values.max
  end

  private

  def royal_flush?
    straight_flush? && hand.any? { |card| card.value == 14}
  end

  def straight_flush?
    straight? && flush?
  end

  def four_of_a_kind?
    values = hand.map { |card| card.value }
    values.any? { |card_value| values.count(card_value) == 4}
  end

  def full_house?
    three_of_a_kind? && pair?
  end

  def flush?
    hand[1..-1].all? {|card| card.suit == hand[0].suit}
  end

  def straight?
    values = hand.map { |card| card.value }
    values.sort.each_cons(2).all? { |card1, card2| card2 - card1 == 1}
  end

  def three_of_a_kind?
    values = hand.map { |card| card.value }
    values.any? { |card_value| values.count(card_value) == 3}
  end

  def two_pair?
    # debugger
    values = hand.map { |card| card.value }
    values = values.map {|card_value| values.count(card_value)}
    values.sort[1..-1].all? {|card_count| card_count == 2}
  end

  def pair?
    values = hand.map { |card| card.value }
    values.any? { |card_value| values.count(card_value) == 2}
  end


end
