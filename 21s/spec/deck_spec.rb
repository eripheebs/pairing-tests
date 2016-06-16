require 'deck'

describe Deck do
  let(:deck) { described_class.new }

  describe '#pick_cards' do
    it 'gets two random cards from the deck into an array' do
      expect(deck.pick_cards).to be_a Array
      expect(deck.pick_cards.length).to be 2
    end
  end

end
