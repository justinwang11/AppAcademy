require_relative "card"

class Deck

  attr_accessor :cards

  VALUES = [:two, :three, :four, :five, :six, :seven, :eight, :nine,
    :ten, :jack, :queen, :king, :ace]

  SUITS = [ :spades, :hearts, :diamonds, :clubs]

  def self.new_deck
    cards = []
    VALUES.each do |value|
      SUITS.each do |suit|
        cards << Card.new(value, suit)
      end
    end
    cards.shuffle!
  end

  def initialize
    @cards = self.class.new_deck
  end

  def draw(num)
    cards.pop(num)
  end

  def size
    cards.size
  end

  def uniq
    cards.uniq
  end

  # def deal
  #   cards.pop(5)
  # end

end
