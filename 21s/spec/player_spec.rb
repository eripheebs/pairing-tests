require 'player'

describe Player do
  fake_number = rand(21)
  fake_number2 = rand(21)
  fake_array = [fake_number, fake_number2]
  let(:player) { described_class.new }

  describe '#initialize' do
    it 'has empty hand' do
      expect(player.hand).to eq([])
    end
  end

  describe '#add_hand' do
    it 'adds the number on cards' do
      fake_number = rand(21)
      fake_number2 = rand(21)
      player.add_cards_to_hand([fake_number, fake_number2])
      expect(player.add_hand).to eq(fake_number + fake_number2)
    end
  end

  describe '#add_cards_to_hand' do
    it 'adds cards to the hand array' do
      fake_cards = [4,5,6]
      player.add_cards_to_hand(fake_cards)
      expect(player.hand.length).to eq(fake_cards.length)
    end
  end

end
