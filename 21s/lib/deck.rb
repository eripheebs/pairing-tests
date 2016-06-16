class Deck
  PACK_OF_CARDS = ([*2..10, *2..10, *2..10, *2..10] << [10]*12 << [11]*4).flatten

  def initialize
    @cards = PACK_OF_CARDS
  end

  def pick_cards
    @cards.sample(2)
  end
end
