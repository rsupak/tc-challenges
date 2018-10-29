# Method to find the largest arrangement of integers in a given array
def largest_arrangement(arr)
  return 'Empty Array' if arr.empty?

  arr.each do |num|
    return 'Only positive numbers are accepted' if num < 0
  end

  str_array = []
  sorted = sort(arr)
  sorted.map { |num| str_array << num.to_s}
  sorted.join.to_i
end

# Utilizes merge sort algorithm to rearrange array
# drawing upon the helper methods (merge & compare)
def sort(arr)
  return arr unless arr.size > 1

  mid = arr.size / 2
  left, right = sort(arr[0...mid]), sort(arr[mid..-1])

  merge(left, right)
end

# helper method to combine the left and right arrays in sorted order.
# sorted order is determined by the compare helper method
def merge(left, right)
  sorted = []
  while [left, right].none?(&:empty?)
    sorted << (compare(left[0], right[0]) ? left.shift : right.shift)
  end
  sorted + left + right
end

# Self defined comparator method that compares integer values of two concatenated 
# integers (using the to_s method) determines which new value is larger after 
# returning the new strings to integers.
def compare(left, right)
  left_right = left.to_s + right.to_s
  right_left = right.to_s + left.to_s
  left_right.to_i > right_left.to_i
end

## Test Cases
# [4, 50, 8, 145] = 8_504_145
puts largest_arrangement([4, 50, 8, 145]).to_s
# [4, 40, 7] = 7440
puts largest_arrangement([4, 40, 7]).to_s
# [4, 46, 7] = 7464
puts largest_arrangement([4, 46, 7]).to_s
# [5, 2, 1, 9, 50, 56] = 95_655_021
puts largest_arrangement([5, 2, 1, 9, 50, 56]).to_s
