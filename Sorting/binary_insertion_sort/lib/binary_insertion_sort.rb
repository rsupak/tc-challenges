require 'byebug'
# Binary insertion sort employs a binary search to determine the correct
# location to insert new elements, and therefore performs ⌈log2(n)⌉ comparisons
# in the worst case, which is O(n log n). The algorithm as a whole still has a
# running time of O(n2) on average because of the series of swaps required for
# each insertion. The number of swaps can be reduced by calculating the
# position of multiple elements before moving them. For example, if the target
# position of two elements is calculated before they are moved into the right
# position, the number of swaps can be reduced by about 25% for random data. 

# main method
# binary insertion sort works similarly to insertion sort, but rather than
# checking the value against every index in the array, it performs a
# binary search on those indices to locate the insertion location.
def binary_insertion_sort(arr)
  (1...arr.length).each do |i|
    debugger
    j = i - 1
    val = arr[i]
    location = binary_search(arr, val, 0, j)
    while j >= location
      arr[j + 1] = arr[j]
      j -= 1
    end
    arr[j + 1] = val
  end
  arr
end

# binary search finds location of insertion for value passed in.
def binary_search(arr, val, low, high)
  if low == high
    return arr[low] > val ? low : low + 1
  end

  return low if low > high

  mid = (low + high) / 2
  return binary_search(arr, val, low, mid - 1) if val < arr[mid]
  return binary_search(arr, val, mid + 1, high) if val > arr[mid]

  mid
end

# test block
if $PROGRAM_NAME == __FILE__
  shuffled_array = Array.new(10) { rand(-100...100) }
  puts "Random Array: #{shuffled_array}"
  puts "Sorted Array: #{binary_insertion_sort(shuffled_array)}"
end
