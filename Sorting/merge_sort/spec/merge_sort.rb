# frozen_string_literal: true

# #merge_sort is a recursive sorting algorithm that begins by dividing
# an array into atomic units. It then combines those atoms into a final array by
# comparing the initial values of each element and pushing the smallest value
# into a new array structure at each recursive level.
def merge_sort(arr)
  return arr unless arr.size > 1

  mid = arr.size / 2
  left = merge_sort(arr[0...mid])
  right = merge_sort(arr[mid..-1])

  merge(left, right)
end

# #merge combines the elements into the sorted array
def merge(left, right)
  sorted = []
  until [left, right].any?(&:empty?)
    sorted << (left[0] < right[0] ? left.shift : right.shift)
  end
  sorted + left + right
end

# def merge(*args)
#   result = []
#   until [*args].any?(&:empty?)
#     result << (args[0].first < args[1].first ? args[0].shift : args[1].shift)
#   end
#   result + [args]
# end
# Test method
if $PROGRAM_NAME == __FILE__
  shuffled_array = Array.new(10) { rand(-100...100) }
  puts "Random Array: #{shuffled_array}"
  puts "Sorted Array: #{merge_sort(shuffled_array)}"
end
