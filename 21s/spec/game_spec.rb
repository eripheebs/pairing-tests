require 'game'

describe Game do
  let(:player_1) { double :player, add_hand: 10, pick_cards: true }
  let(:player_2) { double :player, add_hand: 1, pick_cards: true }
  let(:deck) { double :deck, pick_cards: true }
  let(:game) { described_class.new({ player1: player_1, player2: player_2, deck: deck }) }

  describe '#pick_cards' do
    it 'should pick cards from the deck & send the message to add it to players hand' do
      expect(deck).to receive(:pick_cards)
      expect(player_1).to receive(:pick_cards)
      game.pick_cards(player_1)
    end

    it 'should alert the game is over when eg blackjack happens' do
      BLACKJACK = 21
      allow(player_1).to receive(:add_hand).and_return(BLACKJACK)
      expect{game.pick_cards(player_1)}.to raise_error "Game is over"
    end
  end

  describe '#determine_winner' do
    it 'should return the player who has blackjack if there is one' do
      BLACKJACK = 21
      allow(player_1).to receive(:add_hand).and_return(BLACKJACK)
      expect(game.determine_winner).to eq(player_1)
    end

    it 'should return the player who is not above if neither have blackjack' do
      allow(player_2).to receive(:add_hand).and_return(17)
      allow(player_1).to receive(:add_hand).and_return(22)
      expect(game.determine_winner).to eq(player_2)
    end
  end

  describe '#play_a_game' do
    it 'should play an automated game and then say who the winner is' do
      allow(player_2).to receive(:add_hand).and_return(22)
      allow(player_1).to receive(:add_hand).and_return(17)
      expect(game.play_a_game).to eq("The winner is #{player_1}!")
    end

    it 'should say if there is a draw' do
      allow(player_2).to receive(:add_hand).and_return(18)
      allow(player_1).to receive(:add_hand).and_return(18)
      expect(game.play_a_game).to eq("The winner is nobody, it's a draw!")
    end
  end

end
