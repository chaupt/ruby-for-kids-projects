class Player
  attr_accessor :name, :hand, :chips, :bet

  def initialize(name, chips)
    @name = name
    @hand = []
    @chips = chips
    @bet  = nil
  end

  def discard_hand
      @bet = nil
      @hand = []
  end

  def take_card(card)
    @hand << card
  end

  def sort_hand_by_rank
      @hand.sort! do |card1, card2|
          Card.compare_rank(card1, card2)
      end
  end
  
  def eliminated?
      @chips <= 0
  end

  def pay(amount)
      if amount > @chips
          pay = @chips
          @chips = 0
      else
          pay = amount
          @chips -= amount
      end
      pay
  end

  def win(amount)
      @chips += amount
  end

end
