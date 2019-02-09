# Merge sort involves recursively splitting the array into 2 parts, sorting
# and finally merging them. A variant of merge sort is called 3-way merge
# sort where instead of splitting the array into 2 parts we split it into 3 
# parts. Merge sort recursively breaks down the arrays to subarrays of size
# half. Similarly, 3-way Merge sort breaks down the arrays to subarrays of
# size one third.

# main method
def three_merge_sort(array)
  return array unless array.size > 1

  left = three_merge_sort(array[0...(array.size / 3)])
  center = three_merge_sort(array[(array.size / 3)...(2 * array.size / 3)])
  right = three_merge_sort(array[(2 * array.size / 3)...array.size])

  merge_three(left, center, right)
end

# #merge_three combines the three sorted sub arrays by comparing the first
# element in each array and then pushing the smallest element into the
# sorted array. The value is shifted from the array, eventually emptying the 
# sub array. when one of the sub arrays has been emptied, #merge_three will
# pass the remaining two sub arrays along with the empty array
# (for verification only) and the current sorted array in to #merge_two combine
# the remaining two sub arrays.
def merge_three(left, center, right)
  sorted = []
  until [left, center, right].any?(&:empty?)
    if left[0] < center[0]
      sorted << (left[0] < right[0] ? left.shift : right.shift)
    elsif left[0] >= center[0]
      sorted << (center[0] < right[0] ? center.shift : right.shift)
    end
  end
  merge_two(sorted, left, center, right)
end

# #merge_two identifies the empty array, then combines the remaining two
# arrays by comparing the first element in these arrays and pushing the 
# smallest element into the sorted array (passed in). then similar to 
# #merge_three, the values are shifted out of the sub arrays. when one of 
# the remaining arrays has been emptied, #merge_two will return the sorted
# array concatenated with the remaining array.
def merge_two(sorted, left, center, right)
  if left.empty?
    while [center, right].none?(&:empty?)
      sorted << (center[0] < right[0] ? center.shift : right.shift)
    end
    sorted + center + right
  elsif center.empty?
    while [left, right].none?(&:empty?)
      sorted << (left[0] < right[0] ? left.shift : right.shift)
    end
    sorted + left + right
  else
    while [left, center].none?(&:empty?)
      sorted << (left[0] < center[0] ? left.shift : center.shift)
    end
    sorted + left + center
  end
end

# Test block if file run directly
if $PROGRAM_NAME == __FILE__
  shuffled_array = Array.new(10) { rand(-100...100) }
  puts "Random Array: #{shuffled_array}"
  puts "Sorted Array: #{three_merge_sort(shuffled_array)}"
end
