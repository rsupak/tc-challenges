# Minimum block size to be sorted and merged
MIN = 4

# Main method
# Block sort (also known as Block-Merge Sort) is an in-place sorting algorithm 
# that makes use of the best time complexities inherent in both insertion sort
# and merge sort. The major difference between merge sort and block sort is that
# the merge is made in place. Typically merge sort utilizes a buffer array in
# which the arrays are gathered in sorted order and then returned. 
# Block sort takes in an array, then separates the array into smaller blocks
# The blocks are then sorted using insertion sort for best time complexity 
# O(n^2) is typically better than O(nlogn) time for arrays smaller than 32 items
# once the smaller blocks are sorted, they are then merged in place.
def block_sort(arr)
  return arr if arr.size < 2

  block_start = 0
  block_stop = MIN - 1
  while block_stop < arr.size
    sorting = arr[block_start..block_stop]
    arr[block_start..block_stop] = insertion_sort(sorting)
    block_start += MIN
    if block_stop + MIN < arr.size
      block_stop += MIN
    else
      block_stop = arr.size
    end
  end
  if arr[block_start..block_stop].size < MIN * 2
    arr1 = arr[0...block_start]
    arr2 = arr[block_start..block_stop]
    return merge(arr1, arr2, arr1.size, arr2.size)
  end
  merge_sort(arr)
end

# 
def merge_sort(arr)
  start = 0
  stop = MIN * 2
  while start < arr.size
    arr1 = arr[start...start + MIN]
    arr2 = arr[start + MIN...stop]
    m = arr1.size
    n = arr2.size
    arr[start...stop] = merge(arr1, arr2, m, n)
    p arr
    start = stop
    stop * 2 < arr.size ? stop * 2 : arr.size
  end
  arr
end

def insertion_sort(arr)
  arr.each_index do |index|
    key = arr[index]

    check = index - 1
    while check >= 0 && key < arr[check]
      arr[check], arr[check + 1] = arr[check + 1], arr[check]
      check -= 1
    end
  end
  arr
end

def merge(arr1, arr2, m, n)
  (n - 1).downto(-1).map do |i|
    last = arr1[m - 1]
    j = m - 2

    while j >= 0 && arr1[j] > arr2[i]
      arr1[j + 1] = arr1[j]
      j -= 1
    end

    if j != m - 2 || last > arr2[i]
      arr1[j + 1] = arr2[i]
      arr2[i] = last
    end
  end
  arr1 + arr2
end

# shuffled_arr = Array.new(10) { rand(-100...100) }

# puts "Random arr: #{shuffled_arr}"
# puts "Sorted arr: #{block_sort(shuffled_arr)}"
