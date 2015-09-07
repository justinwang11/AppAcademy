require "rspec"
require "card"

describe Card do

  subject(:new_card) { Card.new }

  describe "#initialize" do
    let(:king_of_hearts) { Card.new(:king,:h) }
    it "initializes with a value and suit" do
      expect(king_of_hearts.value).to eq(13)
      expect(king_of_hearts.suit).to eq(:h)
    end
  end

end
