# Shell sort is a swap sort method similar to insertion sort.
# This method compares values that are a separated by a specified
# gap in the indices. The gap allows for the comparison
# of a smaller number of sub-arrays than insertion sort, and
# greatly decreases the overall iterations of each of those sub arrays,
# that said, shell sort also runs in O(n^2) time, but should show
# an improvement over much larger arrays than insertion sort.

def shell_sort(array)
  len = array.length
  gap = 1

  # calculate gap distance for initial sub-array checks
  gap = gap * 3 + 1 while gap < len / 3

  while gap > 0
    (gap...len).each do |i|
      j = i
      while j >= gap
        if array[j - gap] > array[j]
          array[j - gap], array[j] = array[j], array[j - gap]
        end
        j -= gap
      end
    end
    gap /= 3
  end
  array
end
