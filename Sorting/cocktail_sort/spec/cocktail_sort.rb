# Cocktail_sort is a bi-directional bubble sort variant.
# Like bubble sort, cocktail sort works by iterating through the list,
# comparing adjacent elements and swapping them if they are in the wrong
# order.

def cocktail_sort(array)
  compare = ->(a, b) { a <=> b }
  loop do
    array, swapped = forward_pass(array, compare)
    break unless swapped

    array, swapped = reverse_pass(array, compare)
    break unless swapped
  end
  array
end

# The following 2 helper methods are the swap methods for the
# bi-directional passes. a comparator lambda are passed in, and the
# modified array and swapped boolean are returned in order to process
# the next pass in the loop.

# compares numbers from left to right
def forward_pass(array, compare)
  swapped = false
  0.upto(array.length - 2) do |i|
    if compare.call(array[i], array[i + 1]) > 0
      array[i], array[i + 1] = array[i + 1], array[i]
      swapped = true
    end
  end
  [array, swapped]
end

# compares numbers from right to left
def reverse_pass(array, compare)
  swapped = false
  (array.length - 2).downto(0) do |i|
    if compare.call(array[i], array[i + 1]) > 0
      array[i], array[i + 1] = array[i + 1], array[i]
      swapped = true
    end
  end
  [array, swapped]
end
