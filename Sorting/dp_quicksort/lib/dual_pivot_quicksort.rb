# The idea of dual pivot quick sort is to take two pivots, one in the left 
# end of the array and the second, in the right end of the array. The left 
# pivot must be less than or equal to the right pivot, so we swap them if 
# necessary.

# Then, we begin partitioning the array into three parts: in the first part, 
# all elements will be less than the left pivot, in the second part all
# elements will be greater or equal to the left pivot and also will be
# less than or equal to the right pivot, and in the third part all
# elements will be greater than the right pivot. Then, we shift the two
# pivots to their appropriate positions as we see in the below bar, and
# after that we begin quicksorting these three parts recursively, using
# this method.

# Main method
def dual_pivot_quicksort(arr)
  return [] if arr.empty?
  return arr if arr.size == 1

  # this check is necessary if the left pivot is larger than the right pivot
  arr[0], arr[-1] = arr[-1], arr[0] if arr[0] > arr[-1]

  l_pivot = arr.shift
  r_pivot = arr.pop
  left, mid, right = Array.new(3) { [] }

  # partitions the array
  arr.each do |num|
    left << num if num <= l_pivot
    mid << num if num > l_pivot && num < r_pivot
    right << num if num >= r_pivot
  end

  [*dual_pivot_quicksort(left), l_pivot,
   *dual_pivot_quicksort(mid), r_pivot,
   *dual_pivot_quicksort(right)]
end

# Test method
if $PROGRAM_NAME == __FILE__
  shuffled_array = Array.new(10) { rand(-100...100) }
  puts "Random Array: #{shuffled_array}"
  puts "Sorted Array: #{dual_pivot_quicksort(shuffled_array)}"
end
