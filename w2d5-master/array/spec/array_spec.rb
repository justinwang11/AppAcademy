require "rspec"
require "array"

describe Array do

  describe "#my_uniq" do
    let(:example_array) { [1,2,1,3,3] }
    it "returns the unique elements in the order that they appeared" do
      expect(example_array.my_uniq).to eq([1,2,3])
    end
    let(:larger_array) { [5,3,7,5,7,4,3]}
    it "does things correctly for a larger array" do
      expect(larger_array.my_uniq).to eq([5,3,7,4])
    end
  end

  describe "#two_sum" do
    let (:example_array) { [-1, 0, 2, -2, 1] }
    it "find the pairs of positions where the elements at that position sum to zero" do
      expect(example_array.two_sum).to eq([[0,4], [2,3]])
    end
  end

  describe "#median" do
    let (:example_array1) { [ -2, -1, 0, 1, 2] }
    let (:example_array2) { [1, 6, 2, 4] }

    it "for odd numbered arrays, it returns the middle value" do
      expect(example_array1.median).to eq(0)
    end

    it "for even numbered arrays, it returns the average of the two innermost items" do
      expect(example_array2.median).to eq(3)
    end
  end

  describe "#my_transpose" do
    let (:example_array) { [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8]
    ] }

    it "transposes the array" do
      expect(example_array.my_transpose).to eq([
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8]
      ])
    end
  end



end
