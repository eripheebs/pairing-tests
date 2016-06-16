class Game
  BLACKJACK = 21
  SWITCH = 17
  attr_reader :player1, :player2, :deck

  def initialize(args)
    @player1 = args[:player1]
    @player2 = args[:player2]
    @deck = args[:deck]
  end

  def play_a_game
    play_round(player1)
    play_round(player2)
    "The winner is #{determine_winner}!"
  end

  def pick_cards(player)
    player.pick_cards(deck.pick_cards)
    game_over_error(score_hand(player))
  end

  def determine_winner
    game_isnt_over_error
    return "nobody, it's a draw" if draw?(player1, player2)
    return higher_score(player1, player2)
  end

  private

  def higher_score(player1, player2)
    return player1 if higher?(player1, player2) && lower_or_eq_blackjack(player1)
    return player2
  end

  def play_round(player)
    until over_17(player) do
      pick_cards(player)
    end
  end

  def lower_or_eq_blackjack(player)
    score_hand(player) <= BLACKJACK
  end

  def higher?(player, player2)
    score_hand(player) > score_hand(player2)
  end

  def draw?(player, player2)
    score_hand(player) == score_hand(player2)
  end

  def game_over_21?
    over_blackjack(player1) || over_blackjack(player2)
  end

  def game_over?
    over_17(player1) || over_17(player2)
  end

  def over_17(player)
    score_hand(player) >= SWITCH
  end

  def over_blackjack(player)
    score_hand(player) >= BLACKJACK
  end

  def score_hand(player)
    player.add_hand
  end

  def blackjack?(player)
    score_hand(player) == BLACKJACK
  end

  def game_over_error(score)
    raise "Game is over" if game_over_21?
  end

  def game_isnt_over_error
    raise "Game isn't over" if !game_over?
  end
end
