# block sort method heavily relies on the interpretation of
# wikipedia's block-merge-sort and java implementation of 
# BonzaiThePenguin's write-up on Block Sort (WikiSort)
# https://github.com/BonzaiThePenguin/WikiSort/blob/master/WikiSort.java
# without which, this project would not have been completed.

# global cache for holding array items to be sorted
### Personal Note ###
# I hesitate to make this a specific size when using Ruby's dynamic
# array structure. But trying to stick to the O(1) memory usage,
# I'm creating a sized CACHE array for merging access using an external buffer.
CACHE = Array.new(512)

# method takes in two elements (individual numbers or ranges of numbers)
# and swaps their location in the arr
def swap(a, b)
  a, b = b, a
  [a, b]
end

# method to find the nearest binary root rounded down
def floor_power_of_two(num)
  num |= num >> 1
  num |= num >> 2
  num |= num >> 4
  num |= num >> 8
  num |= num >> 16
  num |= num >> 32
  num - (num >> 1)
end

# finds the index of the specified value in the sub-arr
def linear_search(arr, range, value)
  index = range.first
  while index < range.last
    return index if arr[index] == value

    index += 1
  end
end

#  finds the first place to insert a value in order
def binary_first(arr, value, range)
  start = range.first
  last = range.last

  while start <= last
    mid = start + (last - start) / 2
    arr[mid] < value ? start = mid + 1 : last = mid
  end
  start += 1 if start == range.last && arr[start] < value
  start
end

# finds the last place to insert a value in order
def binary_last(arr, value, range)
  start = range.first
  last = range.last

  while start < last
    mid = start + (last - start) / 2
    arr[mid] <= value ? start = mid + 1 : last = mid
  end
  start += 1 if start == range.last && arr[start] < value
  start
end

# The next 4 methods combine a linear search with a binary search to reduce 
# the number of comparisons in situations where have some idea as to how many
# unique values there are and where the next value might be.
def find_first_forward(arr, value, range, unique)
  return range.first if range.count.zero?

  skip = [1, range.count / unique].max
  index = range.first + skip
  while arr[index - 1] < value
    return binary_first(arr, value, [index, range.last]) if index >= range.last - skip

    index += skip
  end
  binary_first(arr, value, [index - skip, index])
end

def find_last_forward(arr, value, range, unique)
  return range.first if range.count.zero?

  skip = [1, range.count / unique].max
  index = range.first + skip
  while value > arr[index - 1]
    return binary_last(arr, value, [index, range.last]) if index >= range.last - skip

    index += skip
  end
  binary_last(arr, value, [index - skip, index])
end

def find_first_backward(arr, value, range, unique)
  return range.first if range.count.zero?

  skip = [1, range.count / unique].max
  index = range.last - skip
  while index > range.first && arr[index - 1] > value
    return binary_first(arr, value, [range.first, index]) if index < range.first + skip

    index -= skip
  end
  binary_first(array, value, [index, index + skip])
end

def find_last_backward(arr, value, range, unique)
  return range.first if range.count.zero?

  skip = [1, range.count / unique].max
  index = range.last - skip
  while index > range.first && value < arr[index - 1]
    return binary_last(arr, value, [range.first, index])

    index -= skip
  end
  binary_last(arr, value, [index, index + skip])
end

# insertion sort will be our sorting method for smaller arrs,
# while it runs in O(n^2) time efficiency, for smaller arrs / sub-arrs,
# this typically can be more efficient than O(nlogn) time of other
# sorting methods.
def insertion_sort(arr, range)
  index1 = range.first + 1
  while index1 < range.last
    temp = arr[index1]
    index2 = index1
    while index2 > range.first && arr[index2 - 1] > temp
      arr[index2] = arr[index2 - 1]
      index2 -= 1
    end
    arr[index2] = temp
    index1 += 1
  end
  arr
end

# reverses a range of numbers within the original arr 
def reverse(arr, range)
  arr[range.first...range.last] = arr[range.first...range.last].reverse
  arr
end

# method uses the above swap method to swap sub-arrs within the main arr
def block_swap(arr, index1, index2, count)
  index = 0
  while index < count
    a = arr[index1 + index]
    b = arr[index2 + index]
    arr[index1 + index], arr[index2 + index] = swap(a, b)
    index += 1
  end
  arr
end

# uses the above reverse method in order to rotate a sub-arr in place
# positive amounts rotate left, negative amount rotate right
def rotate(arr, range, amount)
  arr = reverse(arr, [range.first, range.first + amount])
  arr = reverse(arr, [range.first + amount, range.last])
  reverse(arr, range)
end

def merge(arr, rangeA, rangeB)
  buffer = []
  rangeA.each { |index| buffer << arr[index] }
  a_count = b_count = insert = 0
  while a_count < rangeA.count && b_count < rangeB.count
    if buffer[a_count] <= arr[rangeB.first + b_count]
      arr[rangeA.first + insert] = buffer[a_count]
      a_count += 1
    else
      arr[rangeA.first + insert] = arr[rangeB.first + b_count]
      b_count += 1
    end
    insert += 1
  end
  arr
end

# merge two ranges from one array and save the results into a different array
## set equal to a range when merging a[range] = merge_into...
def merge_into(from, rangeA, rangeB, into, at_index)
  a_index = from[rangeA.first], b_index = from[rangeB.first]
  a_last = from[rangeA.last], b_last = from[rangeB.last]
  insert_index = at_index

  loop do
    if from[b_index] > from[a_index]
      into[insert_index] = from[a_index]
      a_index += 1
      insert_index += 1
      if a_index == a_last
        into += from[b_index...from.size]
        break
      end
    else
      into[insert_index] = from[b_index]
      b_index += 1
      insert_index += 1
      if b_index == b_last
        into += [a_index..a_last]
        break
      end
    end
  end
  into
end

# merge using an external buffer
def merge_external(arr, rangeA, rangeB)
  CACHE[rangeA.first..rangeA.last] = arr[rangeA.first..rangeA.last]
  a_index = 0
  b_index = rangeB.first
  insert_index = rangeA.first
  a_last = rangeA.length
  b_last = rangeB.last

  if rangeB.count > 0 && rangeA.count > 0
    loop do
      if arr[b_index] > CACHE[a_index]
        arr[insert_index] = CACHE[a_index]
        a_index += 1
        insert_index += 1
        break if a_index == a_last
      else
        arr[insert_index] = arr[b_index]
        b_index += 1
        insert_index += 1
        break if b_index == b_last
      end
    end
  end
  arr
end

# merge using an internal buffer
# utilizes block_swap method to shift items within the array
def merge_internal(arr, rangeA, rangeB, buffer)
  a_count = 0, b_count = 0, insert = 0
  if rangeB.count > 0 && rangeA.count > 0
    loop do
      if arr[rangeB.first + b_count] > arr[buffer.first + a_count]
        swap = arr[rangeA.first + insert]
        arr[rangeA.first + insert] = arr[buffer.first + a_count]
        arr[buffer.first + a_count] = swap
        a_count += 1
        insert += 1
        break if a_count >= rangeA.count
      else
        swap = arr[rangeA.first + insert]
        arr[rangeA.first + insert] = arr[rangeB.first + b_count]
        arr[rangeB.first + b_count] = swap
        b_count += 1
        insert += 1
        break if b_count >= rangeB.count
      end
    end
  end
  index1 = buffer.first + a_count
  index2 = rangeA.start + insert
  count = rangeA.count - a_count
  block_swap(arr, index1, index2, count)
  arr
end

# merge without buffer using binary searches and the rotate method
# to rotate rangeA into position
def merge_in_place(arr, rangeA, rangeB)
  return arr if rangeA.count.zero? || rangeB.count.zero?

  a = Range.new(rangeA.first, rangeA.last)
  b = Range.new(rangeB.first, rangeB.last)
  loop do
    mid = binary_first(arr, arr[a.first], b)
    amount = mid = a.last
    rotate(arr, Range.new(a.first, mid), -amount)
    break if b.last == mid

    b.first = mid
    a = Range.new(a.first + amount, b.first)
    a.first = binary_last(arr, arr[a.first], a)
    break if a.count.zero?
  end
end

# to be built out for merges larger than 16 items
def net_swap(arr, order, range, x, y)
  compare = arr[range.first + x] <=> arr[range.first + y]
  if compare > 0 || (order[x] > order[y] && compare.zero)
    swap = arr[range.first + x]
    arr[range.first + x = arr[range.first + y]]
    arr[range.first + y] = swap
    swap2 = order[x]
    order[x] = order[y]
    order[y] = swap2
  end
end

# outer sort loop
# bottom-up merge sort combined with an in-place merge for O(1) memory usage
def block_sort(arr)
  return arr if arr.size.zero?

  power_of_two = floor_power_of_two(arr.size)
  scale = arr.size / power_of_two
  start = 0
  while start < power_of_two
    start *= scale
    finish = arr.size > 16 ? (start + 16) * scale : (start + arr.size) * scale
    insertion_sort(arr, [start, finish])
    start = arr.size > 16 ? start + 16 : start + arr.size - start
    finish = arr.size > 16 ? (start + 16) * scale : (start + arr.size) * scale
  end

  size = arr.size > 16 ? 16 : arr.size
  while size < power_of_two
    low = 0
    while low < power_of_two
      low *= scale
      mid = (low + size - 1) * scale
      high = [arr.count - 1, low + 2 * size - 1].min * scale
      if arr[high - 1] < arr[low]
        rotate(arr, mid - low, [low, high])
      else
        merge(arr, Range.new(low, mid - 1), Range.new(mid, high))
      end
      low += size * 2
    end
    size += size
  end
  arr
end

shuffled_arr = Array.new(16) { rand(-100...100) }

puts "Random arr: #{shuffled_arr}"
puts "Sorted arr: #{block_sort(shuffled_arr)}"
