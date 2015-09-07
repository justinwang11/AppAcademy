require 'byebug'

def range(start, final)
  return [] if final < start
  arr = range(start, final-1)
  arr << final
  arr
end

def exp(base, power)
  return 1 if power == 0
  base * exp(base, power - 1)
end

def exp2(base, power)
  if power == 0
    return 1
  elsif power == 1
    return base
  end
  if power.even?
    exp2(base, power/2) * exp2(base, power/2)
  else
    base * (exp2(base, (power - 1) / 2)) * (exp2(base, (power - 1) / 2))
  end

end

#p exp2(5, 4)


def count_double_recursion(n)
  return 1 if n == 0
  count_double_recursion(n/2) + count_double_recursion(n/2)

end

# p count_double_recursion(256)

def deep_dup(array)
  return array.dup unless array.is_a?(Array)
  duplicate = []
  array.each do |el|
    duplicate << deep_dup(el)
  end
  duplicate
end

#
# b = ["cat", ["dog"], ["cow", ["horse"]]]
# p b
# a = deep_dup(b)
#
# a[2][0].reverse!
# p a
# p b

def fibonacci_i(n)
  return [] if n == 0
  return [1] if n == 1
  answer = [1, 1]
  while answer.length < n
    answer << answer.last + answer[-2]
  end
  answer
end

def fibonacci_r(n)
  return [] if n == 0
  return [1] if n == 1
  return [1, 1] if n == 2
  array = fibonacci_r(n - 1)
  array << array.last + array[-2]
end

def bsearch(array, target)
  pivot_idx = array.length/2
  pivot = array[array.length/2]
  if array.length == 1
    if pivot != target
      return nil
    else
      return pivot_idx
    end
  end
  left = array.take(pivot_idx)
  right = array.drop(pivot_idx)
  if pivot == target
    return pivot_idx
  elsif pivot > target
    bsearch(left, target)
  else
    pivot_idx + bsearch(right, target)
  end
end
# p fibonacci_r(10)

# p bsearch([1, 2, 3], 1) # => 0
# p bsearch([2, 3, 4, 5], 3) # => 1
# p bsearch([2, 4, 6, 8, 10], 6) # => 2
# p bsearch([1, 3, 4, 5, 9], 5) # => 3
# p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
# p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# p bsearch([1, 2, 3, 4, 5, 7, 8, 9, 10, 11], 9) # => nil
#
# [1, 2, 3, 4, 5, 6] 5
#
#  pivot_idx = 3
#  right [5, 6]
#
#  pivot_idx = 1
#  [5]
#  pivot_idx = 0

def make_change(money, change)
  return [] if money == 0
  if change.first > money
    make_change(money, change.drop(1))
  else
    make_change(money - change.first, change).unshift(change.first)
  end
end



def make_change2(money, change)
  return [] if money == 0
  best = nil
  change.each do |coin|
    if coin > money
      make_change2(money, change.drop(change.index(coin) + 1))
    else
    # debugger
      attempt = make_change2(money - coin, change).unshift(coin)
      best = attempt if best.nil? || best.length > attempt.length
    end
  end
  best
end

#p make_change2(14, [10,7,1])

def merge_sort(array)
  return array if array.empty?
  return array if array.length == 1
  right = array.drop(array.length/2)
  left = array - right
  merge(merge_sort(left), merge_sort(right))
end

def merge(arr1, arr2)
  sorted_arr = []
  until arr1.empty? || arr2.empty?
    if arr1.first > arr2.first
      sorted_arr << arr2.first
      arr2.shift
    else
      sorted_arr << arr1.first
      arr1.shift
    end
  end
  sorted_arr + arr1 + arr2
end

a = (1..8).to_a.shuffle!
# p a
p merge_sort(a)

def subsets(array)
  return [array] if array.empty?
  last_el = array.last
  previous_set = subsets(array[0...-1])
  new_set = previous_set.map do |el|
    el + [last_el]
  end
  previous_set + new_set
end

b = [1,2,3]

# p subsets(b)
