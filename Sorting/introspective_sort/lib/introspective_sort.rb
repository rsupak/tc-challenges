# Introspective_sort sort is a version of hybrid sorting method. It utilizes
# the best parts of both quicksort and heapsort. When quicksort reaches
# a large recursion amount, the time complexity tends closer to O(n^2).
# In such a case, the sort can be optimized by incorporating the heapsort
# to process the (quicksort) partition it is currently working on.
# In this way the recursion depth does not continue to increase as it would
# with quicksort and guarantees a worst-case performance of O(n*log2(n)).
#
# This version of introspective_sort sort switches to Heapsort when its
# recursion depth reaches 2*(floor(log2(n))).

# main method
# depth_limit is found the change-of-base formula
# logn(x) = log10(x) / log10(n)
def introspective_sort(array)
  return array if array.empty?

  depth_limit = (2 * Math.log10(array.size) / Math.log10(2)).floor
  quick_sort(array, depth_limit)
end

# modified quicksort that takes into account the current recursion
# depth limit. Once the threshold is met, it switches over to heap
# sort for optimization.
def quick_sort(array, depth_limit)
  return array if array.size <= 1
  return heap_sort(array) if depth_limit.zero?

  depth_limit -= 1
  pivot = array.delete_at(rand(array.size))
  left, right = array.partition { |num| pivot > num }

  [*quick_sort(left, depth_limit), pivot, *quick_sort(right, depth_limit)]
end

# Heapsort can be thought of as an improved selection sort: like that algorithm,
# it divides its input into a sorted and an unsorted region, and it iteratively
# shrinks the unsorted region by extracting the largest element and moving that
# to the sorted region
def heap_sort(array)
  build_heap(array)
  last = array.size - 1
  until last <= 0
    swap(array, 0, last)
    last -= 1
    array[0..last] = build_heap(array[0..last])
  end
  array
end

# heap sort helper method
# creates max heap structure
def build_heap(array)
  array.each_index do |i|
    if array[i] > array [i / 2]
      swap(array, i, i / 2)
      build_heap(array)
    end
  end
end

# heap sort helper method
# swaps first and last items in the sub arrays
def swap(array, first, last)
  array[first], array[last] = array[last], array[first]
end

if $PROGRAM_NAME == __FILE__
  shuffled_array = Array.new(10) { rand(-100...100) }

  puts "Random Array: #{shuffled_array}"
  puts "Sorted Array: #{introspective_sort(shuffled_array)}"
end
