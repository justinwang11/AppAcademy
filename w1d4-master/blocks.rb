class Array
  def my_each(&prc)
    i = 0
    while i < self.length
      prc.call(self[i])
      i += 1
    end
  end

  def my_map(&prc)
    result = []
    self.my_each {|el| result << prc.call(el) }
    result
  end

  def my_select(&prc)
    result = []
    self.my_each { |el| result << el if prc.call(el) }
    result
  end

  def my_inject(&prc)
    result = self.first
    self.drop(1).my_each { |el| result = prc.call(result,el) }
    result
  end

  def my_sort!(&prc)
    i = 0
    sorted = false
    while !sorted
      sorted = true
      j = 0
      while j < self.length-1
        if prc.call(self[j], self[j+1]) == 1
          self[j], self[j+1] = self[j+1], self[j]
          sorted = false
        end
        j += 1
      end
      i += 1
    end
  end

  def my_sort(&prc)
    new_array = self.dup
    new_array.my_sort!(&prc)
    new_array
  end
end

def eval_block(*arg, &block)
  return puts "NO BLOCK GIVEN!" unless block_given?
  block.call(*arg)
end

# [1,2,3].my_each {|el| puts "#{el + 2}" }
#
# p [1,2,3].my_map {|el| el + 2 }
#
# p [1,2,3].my_select { |el| el <= 2 }
#
# p [1,2,3].my_inject { |sum, num| (sum + num)*2 }
#
# a = [2,1,3]
# a.my_sort! { |num1, num2| num2 <=> num1 }
# p a
# p a.my_sort { |num1, num2| num1 <=> num2 }


# Example calls to eval_block
eval_block("Kerry", "Washington", 23) do |fname, lname, score|
  puts "#{lname}, #{fname} won #{score} votes."
end
# Washington, Kerry won 23 votes.
# => nil
eval_block(1,2,3,4,5) do |*args|
  answer = args.inject(:+)
  puts answer
end
# => 15

eval_block(1, 2, 3)
# => "NO BLOCK GIVEN"
