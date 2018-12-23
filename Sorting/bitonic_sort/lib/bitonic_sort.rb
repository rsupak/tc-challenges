# Bitonic sort is a recursive sorting algorithm that recursively creates
# Bitonic sequences until an array is sorted. A bitonic sequence is a sequence
# that both increments for 1 part an decrements for the other.
# 1,2,3,4,6,5,3,1 is an example of a bitonic sequence. The sorting method
# creates a bitonic sequence from a random array, then recursively builds a
# bitonic sequence that returns the length of the array as the incrementing
# part and a zero length array as the decrementing part. The method also
# requires that the length of the array be a power of 2. So placeholder values
# (Float::INFINITY) are added to the end of the array until it is the length of
# the next highest power of two. Then after the array is sorted, the
# placeholders are popped from the array until the original array length has been
# attained.
def bitonic_sort(array)
  return array if array.length <= 1

  length = array.length
  num = nearest_power_of_2(array.length)

  # add place holder values
  array << Float::INFINITY until array.length == num

  array = bitonic_recurse(array, 0, array.length, 1)

  # remove place holder values
  array.pop until array.length == length

  array
end

# if array length is not a power of 2, identifies the next highest power of 2
def nearest_power_of_2(num)
  temp = num
  temp -= 1
  temp |= temp >> 1
  temp |= temp >> 2
  temp |= temp >> 4
  temp |= temp >> 8
  temp |= temp >> 16
  temp += 1
  temp
end

# helper method to create bitonic sequence by swapping block in either ascending
# or descending order depending on the passed in direction
def compare_and_swap(array, i, j, dir)
  return unless dir == 1 && array[i] > array[j] ||
                dir == -1 && array[i] < array[j]

  array[i], array[j] = array[j], array[i]
end

# It recursively sorts a bitonic sequence in either ascending or descending order.
# starting at the index position low. The count parameter is the number of items
# to be sorted. Direction is either -1 or 1 to indicate ascending or descending order.
def bitonic_merge(array, low, count, direction)
  return if count <= 1

  mid = count / 2
  (low...low + mid).each do |i|
    compare_and_swap(array, i, i + mid, direction)
  end
  bitonic_merge(array, low, mid, direction)
  bitonic_merge(array, low + mid, mid, direction)
end

# This function produces the bitonic sequence by recursively sorting its two
# halves in opposite sorting orders and then calls bitonic_merge to make them
# in the same order.
def bitonic_recurse(arr, low, count, direction)
  return if count <= 1

  mid = count / 2
  bitonic_recurse(arr, low, mid, 1)
  bitonic_recurse(arr, low + mid, mid, -1)
  bitonic_merge(arr, low, count, direction)
  arr
end
