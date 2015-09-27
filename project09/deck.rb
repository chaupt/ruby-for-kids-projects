class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def shuffle
    unless cards.empty?
      cards.shuffle!
    end
  end

  def deal
    unless cards.empty?
      cards.pop
    end
  end

  def size
    cards.length
  end

end

