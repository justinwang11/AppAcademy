
class Card
  attr_reader :value, :face_up
  def initialize(val = nil)
    @value = val
    @face_up = false
  end

  def hide
    @face_up = false
  end

  def reveal
    @face_up = true
  end

  def to_s
    @face_up ? @value.to_s : "*"
  end

  def ==(other_card)
    @value == other_card.value
  end

end
