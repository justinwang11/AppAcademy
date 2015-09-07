class Hand

  # def self.draw_from(deck)
  #   Hand.new(deck.draw(5))
  # end

  attr_accessor :player_hand

  def initialize(cards = [])
    #cards << self.class.draw_from(deck)
    @player_hand = cards
  end

  def size
    player_hand.size
  end

  def discard(card)
    @player_hand.delete(card)
  end

  def compare_hands(other_hand)
    @player_hand
  end

  def value_counter
    value_counter = Hash.new { |h, k| h[k] = 0 }
    @player_hand.each do |card|
      value_counter[card.value] += 1
    end
    value_counter
  end



end
