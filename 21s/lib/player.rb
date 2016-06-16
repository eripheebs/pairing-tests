class Player
  attr_reader :hand

  def initialize
    @hand = []
  end

  def add_hand
    score = 0
    hand.each do |value|
      score += value
    end
    return score
  end

  def add_cards_to_hand(cards)
    @hand = (hand << cards).flatten;
  end
end
