class Player
  attr_reader :hand, :deck

  def initialize(deck)
    @hand = []
    @deck = deck

    pick_cards
  end

  def add_numbers(hand_array)
    score = 0
    hand_array.each do |value|
      score += value
    end
    return score
  end

  def pick_cards
    @hand = (hand << deck.pick_cards).flatten;
  end

end
