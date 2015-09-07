require "hand"
require "rspec"

describe Hand do
  describe "::draw_from" do
    let(:deck) { double("deck") }
    let(:hand) { Hand.draw_from(deck) }

    it "returns a new Hand" do
      allow(deck).to receive(:draw).and_return("h")
      expect(hand).to be_instance_of(Hand)
    end

    it "draws from the passed-in deck" do
      expect(deck).to receive(:draw)
      hand
    end
  end

  describe "#initialize" do
    let(:new_hand) { Hand.new([1,2,3,4,5]) }

    it "has five cards" do
      expect(new_hand.size).to eq(5)
    end
  end

  describe "#discard" do
    # let(:discarding_card) { double("card") }
    let(:current_hand) { Hand.new([1,2,3,4,5]) }
    let(:discarding_card) { 3 }

    it "discards the requested card" do
      expect(current_hand.discard(discarding_card)).to eq(discarding_card)
    end
  end

  describe "#compare_hands" do
    let(:card1) { double("card1") }
    let(:card2) { double("card2") }
    let(:card3) { double("card3") }
    let(:card4) { double("card4") }
    let(:card5) { double("card5") }
    let(:card6) { double("card6") }
    let(:card7) { double("card7") }
    let(:card8) { double("card8") }
    let(:card9) { double("card9") }
    let(:card10) { double("card10") }
    let(:player_hand) { Hand.new(card1, card2, card3, card4, card5) }
    let(:other_hand) { Hand.new(card6, card7, card8., card9, card10)}
    it "chooses a four-of-a-kind over a flush" do
      allow(card1).to receive(:initialize).and_return(13, :hearts)
      expect()



end
