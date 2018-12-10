# Bogo_sort is a random sorting method that usually comes in 
# one of two styles. The first (shuffle sort) takes in an array, checks to see 
# if it is sorted, if not, it then switches between shuffling the
# array and checking whether or not it is sorted until the array is sorted. 
# Or after the initial check, it returns permutations of the array
# to check for sort, until it finds the correct permutation (permutation sort)

# shuffle sort variation (uses Ruby's built in shuffle! method to shuffle the array
def bogo_sort(array)
  until in_order?(array)
    array = array.shuffle!
  end
  array
end

# helper method to test whether or not each item in the array is in ascending order
def in_order?(array)
  (0..array.size - 2).all? { |index| array[index] <= array[index + 1] }
end

# permutation sort variation (uses Ruby's built in permutation method)
# creates an array of all of the permutations, then tests each item in the
# permutations array until it locates the sorted array.
#
# def perm_sort(array)
#   return array if in_order?(array)

#   perms = array.permutation.to_a
#   perms.each do |perm|
#     return perm if in_order?(perm)
#   end
# end

# shuffled_array = Array.new(5) { rand(-100...100) }

# puts "Random Array: #{shuffled_array}"
# puts "Sorted Array: #{bogo_sort(shuffled_array)}"
# puts "Sorted Array: #{perm_sort(shuffled_array)}"
