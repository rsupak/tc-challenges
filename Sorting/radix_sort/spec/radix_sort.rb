# Radix sort is a sorting technique that differs significantly many other sorting
# technique. It is a variation on a bucket sort technique that places each item in
# a specific bucket according to the value at the least significant digit (when comparing)
# integers, and most significant "digit" when comparing strings. This radix sort is 
# specifically designed to compare positive and negative integers quickly, by making only
# a many passes over the entire array, as there are digits in each specific range.
# For example, if the largest number in the array is positive and it contains 3 digits, 
# radix sort will only require 3 passes over then entire array to sort the array, 
# however, if the largest positive number contains only 2 digits, and the smallest 
# negative number contains 4 digits, radix sort will make 6 total passes over the numbers 
# before returning a sorted array.

# main method
def radix_sort(array)
  # create a container arrays positive and negative numbers
  pos_array, neg_array = separate_arrays(array)
  pos_array = array_sort(pos_array)
  neg_array = negative_swap(negative_sort(neg_array)).reverse

  # return sorted array
  neg_array + pos_array
end

# separates positive numbers from negative numbers
def separate_arrays(array)
  pos_array = []
  neg_array = []
  array.each do |num|
    num >= 0 ? pos_array << num : neg_array << num
  end
  [pos_array, neg_array]
end

# in order for negative numbers to be sorted appropriately, we must first
# make them positive numbers.
def negative_swap(array)
  array.map(&:-@)
end

# determine number of passes based on largest digit (or negative number)
def pass_count(array)
  return 0 if array.empty?

  array.max.zero? ? 1 : Math.log10(array.max).to_i + 1
end

# radix sort method
def array_sort(array)
  passes = pass_count(array)

  passes.times do |i|
    # create a new set of buckets for each pass
    buckets = Array.new(10, [])
    # iterate over the array an put numbers in buckets keyed to radix
    array.each do |n|
      digit = n.to_s.length > i ? n % (10**(i + 1)) / (10**i) : 0
      buckets[digit] += [n]
    end
    # return numbers to new_array in bucket order
    array = buckets.flatten
  end
  array
end

# helper method to sort the negative number array
def negative_sort(array)
  array = negative_swap(array)
  array_sort(array)
end
