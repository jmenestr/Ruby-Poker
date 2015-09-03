require 'hand'
require 'rspec'

describe Hand do

  let(:royal_flush) do
    [ double(value: 14, suit: :hearts ), double(value: 13, suit: :hearts ),
      double(value: 12, suit: :hearts ), double(value: 11, suit: :hearts ),
      double(value: 10, suit: :hearts )]
  end
  let(:straight_flush) do
      [ double(value: 9, suit: :hearts ), double(value: 13, suit: :hearts ),
        double(value: 12, suit: :hearts ), double(value: 11, suit: :hearts ),
        double(value: 10, suit: :hearts )]
  end
  let(:four_of_a_kind) do
    [ double(value: 14, suit: :hearts ), double(value: 14, suit: :spade ),
      double(value: 14, suit: :diamonds ), double(value: 14, suit: :clubs ),
      double(value: 2, suit: :hearts )]
  end
  let(:full_house) do
    [ double(value: 14, suit: :hearts ), double(value: 14, suit: :clubs ),
      double(value: 14, suit: :spades), double(value: 10, suit: :hearts ),
      double(value: 10, suit: :spades )]
  end
  let(:flush) do
    [ double(value: 14, suit: :hearts ), double(value: 2, suit: :hearts ),
      double(value: 7, suit: :hearts ), double(value: 3, suit: :hearts ),
      double(value: 9, suit: :hearts )]
  end
  let(:straight) do
      [ double(value: 9, suit: :hearts ), double(value: 13, suit: :hearts ),
        double(value: 12, suit: :spade), double(value: 11, suit: :hearts ),
        double(value: 10, suit: :hearts )]
  end
  let(:three_of_a_kind) do
    [ double(value: 14, suit: :hearts ), double(value: 14, suit: :spade ),
      double(value: 14, suit: :diamonds ), double(value: 10, suit: :clubs ),
      double(value: 2, suit: :hearts )]
  end
  let(:two_pair) do
    [ double(value: 14, suit: :hearts ), double(value: 14, suit: :spade ),
      double(value: 3, suit: :diamonds ), double(value: 3, suit: :clubs ),
      double(value: 2, suit: :hearts )]
  end
  let(:pair) do
    [ double(value: 14, suit: :hearts ), double(value: 14, suit: :spade ),
      double(value: 3, suit: :diamonds ), double(value: 6, suit: :clubs ),
      double(value: 2, suit: :hearts )]
  end


  describe '#calculate_hand' do
    context 'when the hand is a royal flush' do
      it "hand score is 10" do
        hand = Hand.new(royal_flush)
        expect(hand.calculate_hand).to eq(10)
      end
    end

    context 'when the hand is a straight flush' do
      it "hand score is 9" do
        hand = Hand.new(straight_flush)
        expect(hand.calculate_hand).to eq(9)
      end
    end

    context 'when the hand is four_of_a_kind' do
      it "hand score is 8" do
        hand = Hand.new(four_of_a_kind)
        expect(hand.calculate_hand).to eq(8)
      end
    end

    context 'when the hand is a full_house' do
      it "hand score is 7" do
        hand = Hand.new(full_house)
        expect(hand.calculate_hand).to eq(7)
      end
    end

    context 'when the hand is a flush' do
      it "hand score is 6" do
        hand = Hand.new(flush)
        expect(hand.calculate_hand).to eq(6)
      end
    end

    context 'when the hand is a straight' do
      it "hand score is 5" do
        hand = Hand.new(straight)
        expect(hand.calculate_hand).to eq(5)
      end
    end

    context 'when the hand is three of a kind' do
      it "hand score is 4" do
        hand = Hand.new(three_of_a_kind)
        expect(hand.calculate_hand).to eq(4)
      end
    end

    context 'when the hand is a two pair' do
      it "hand score is 3" do
        hand = Hand.new(two_pair)
        expect(hand.calculate_hand).to eq(3)
      end
    end

    context 'when the hand is a pair' do
      it "hand score is 2" do
        hand = Hand.new(pair)
        expect(hand.calculate_hand).to eq(2)
      end
    end
  end

  describe '#winning_hand' do

    context 'higher hand value wins' do
      context 'royal flush win\'s all' do
        subject(:winning_hand) { Hand.new(royal_flush) }
        it 'beats straight flush' do
          losing_hand = Hand.new(straight_flush)
          expect(winning_hand.winning_hand?(losing_hand)).to be(true)
        end
      end
    end

    let(:flush) do
      [ double(value: 14, suit: :hearts ), double(value: 2, suit: :hearts ),
        double(value: 7, suit: :hearts ), double(value: 3, suit: :hearts ),
        double(value: 9, suit: :hearts )]
    end

    context 'whenver tied, highest card value wins' do
      context 'two flush hands' do
        let(:flush_high) do
          [ double(value: 14, suit: :hearts ), double(value: 2, suit: :hearts ),
            double(value: 7, suit: :hearts ), double(value: 3, suit: :hearts ),
            double(value: 9, suit: :hearts )]
        end
        let(:flush_low) do
          [ double(value: 6, suit: :hearts ), double(value: 2, suit: :hearts ),
            double(value: 7, suit: :hearts ), double(value: 3, suit: :hearts ),
            double(value: 9, suit: :hearts )]
        end
        it 'wins with highest card' do
          winning_hand = Hand.new(flush_high)
          losing_hand = Hand.new(flush_low)
          expect(winning_hand.winning_hand?(losing_hand)).to be(true)
        end
      end
    end

  end


end
