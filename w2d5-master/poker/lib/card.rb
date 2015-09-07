class Card

  CARD_VALUES = {
    :two => 2,
    :three => 3,
    :four => 4,
    :five => 5,
    :six => 6,
    :seven => 7,
    :eight => 8,
    :nine => 9,
    :ten => 10,
    :jack => 11,
    :queen => 12,
    :king => 13,
    :ace => 14
  }

  attr_reader :value, :suit

  def initialize(name, suit)
    @value = CARD_VALUES[name]
    @suit = suit
  end

end
