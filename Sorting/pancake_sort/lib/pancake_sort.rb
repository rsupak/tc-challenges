# Pancake Sort

# Given an an unsorted array, sort the given array. You are allowed to do only
# following operation on array.

# flip(array, end_point): Reverse array from 0 to i

# Unlike a traditional sorting algorithm, which attempts to sort with the
# fewest comparisons possible, the goal is to sort the sequence in as few
# reversals as possible.

# The idea is to do something similar to Selection Sort. We one by one place
# maximum element at the end and reduce the size of current array by one.

# Following are the detailed steps. Let given array be arr[] and size of array
# be n.

# Start from current size equal to n and reduce current size by one while
# it is greater than 1. Let the current size be curr_size. Do following for
# every curr_size

# a) Find index of the maximum element in arr[0..curr_size-1].
#    Let the index be 'max_index'.
# b) Call flip(array, max_index)
# c) Call flip(array, curr_size-1)

# main method
def pancake_sort(array)
  duplicate = array.dup
  sort(duplicate)
end

# sorting method
# creates series of sub arrays, decrementing the endpoint index [0..curr_size]
def sort(array)
  (array.size - 1).downto(1) do |curr_size|
    max_index = find_max_index(array, curr_size)
    next if max_index == curr_size

    # flip [0..max_index] if max_index not 0, this will move the max_index to 0
    array = flip(array, max_index) if max_index > 0

    # flip [0..curr_size] to move array.max to the end of the sub array.
    array = flip(array, curr_size)
  end
  array
end

# identifies the max_index and therefore the 'flip point' in the main array
def find_max_index(array, curr_size)
  max = array[0..curr_size].max
  array[0..curr_size].index(max)
end

# 'flips' the array at designated end_point
def flip(array, end_point)
  array[0..end_point] = array[0..end_point].reverse
  array
end

if $PROGRAM_NAME == __FILE__
  shuffled_array = Array.new(10) { rand(-100...100) }
  puts "Random Array: #{shuffled_array}"
  puts "Sorted Array: #{pancake_sort(shuffled_array)}"
end
