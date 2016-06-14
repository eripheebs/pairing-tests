require 'player'

describe Player do
  fake_number = rand(21)
  fake_number2 = rand(21)
  fake_array = [fake_number, fake_number2]
  let(:deck) { double(:deck, pick_cards: fake_array) }
  let(:player) { described_class.new deck }

  describe '#initialize' do
    it 'has two random cards' do
      expect(player.hand.length).to eq(2)
    end
  end

  describe '#add_numbers' do
    it 'adds the number on cards' do
      fake_number = rand(21)
      fake_number2 = rand(21)
      expect(player.add_numbers([fake_number, fake_number2])).to eq(fake_number + fake_number2)
    end
  end

end
