# The following method implements quicksort.
# Quicksort sorts items in an array in place by partitioning the array.
# around a pivot point. Items less than the pivot are returned to the left
# of the pivot; items greater are returned to the right of the array.
# Partitions are created using Ruby's built in partition() method for arrays.
# The left and right sides are then recursively partitioned the
# in a similar manner until the left and right sides are completely
# sorted. Once sorted, the method returns the sorted array.

def quick_sort(array)
  return [] if array.empty?

  pivot = array.delete_at(rand(array.size))
  left, right = array.partition { |num| pivot > num }
  # puts "Left: #{left}, Pivot: #{pivot}, Right: #{right}"

  [*quick_sort(left), pivot, *quick_sort(right)]
end

# arr = [1, 2, 3, 4, 5, 6].shuffle
# puts "Array: #{arr}"
# p quick_sort(arr)
