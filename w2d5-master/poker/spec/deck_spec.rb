require "rspec"
require "deck"

describe Deck do
  subject(:new_deck) { Deck.new }
  describe "#initialize" do


    let(:new_deck2) { Deck.new}
    it "deck has 52 cards" do
      expect(new_deck.size).to eq(52)
    end

    it "deck doesn't have duplicates" do
      expect(new_deck.uniq.size).to eq(52)
    end

  end

  describe "#draw" do
    it "draws (num) cards from the deck" do
      expect(new_deck.cards[47..51]).to eq(new_deck.draw(5))
    end
  end

end
