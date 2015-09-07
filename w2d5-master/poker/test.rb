def test
  things = Hash.new { |h, k| h[k] = 0 }
  [1,1,3,4,6,7,9,9,9].each do |item|
    things[item] += 1
  end
  p things
  # a = things.select { |k, v| v.size == 4 }
  # if a.empty?
  #   b = things.select { |k, v| v.size == 3 }
end

test
