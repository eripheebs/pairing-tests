class Deck
  PACK_OF_CARDS = [*1..13, *1..13, *1..13, *1..13]

  def initialize
    @cards = PACK_OF_CARDS
  end

  def pick_cards
    @cards.sample(2)
  end

end
