class Array

  def my_uniq
    arr = []
    self.each do |el|
      arr << el if !arr.include?(el)
    end
    arr
  end

  def two_sum
    array = []
    i = 0
    until i == self.size - 1
      j = i + 1
      until j == self.size
        if self[i] + self[j] == 0
          array << [i, j]
        end
        j += 1
      end
      i += 1
    end
    array
  end

  def median
    array = self.sort
    if array.size % 2 == 0
      return (array[array.size/2] + array[array.size/2 - 1])/2
    else
      return array[array.size/2]
    end
  end

  def my_transpose
    result = Array.new(self.size) { Array.new(self.size) }
    (0..self.size-1).each do |i|
      (0..self.size-1).each do |j|
        result[j][i] = self[i][j]
      end
    end
    result
  end

end
