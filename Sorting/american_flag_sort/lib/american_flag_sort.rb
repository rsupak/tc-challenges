BUCKETS = 256

# An American flag sort is an efficient, in-place variant of radix sort that
# distributes items into buckets. Non-comparative sorting algorithms such as
# radix sort and American flag sort are typically used to sort large objects
# such as strings, for which comparison is not a unit-time operation. American
# flag sort iterates through the bits of the objects, considering several bits
# of each object at a time. For each set of bits, American flag sort makes two
# passes through the array of objects: first to count the number of objects
# that will fall in each bin, and second to place each object in its bucket.
# This works especially well when sorting a byte at a time, using 256 buckets.
# With some optimizations, it is twice as fast as quicksort for large sets of
# strings. https://en.wikipedia.org/wiki/American_flag_sort

# main method
# radix for the sort comes from the number of BUCKETS allocated to the constant.
# main array must be split into 2 arrays in order to handle negative
# numbers. main method passes each sub array to the sort_splits method
# in order to sort the sub arrays in place. The sorted arrays are concatenated
# and returned in sorted order.
def american_flag_sort(array)
  pos_array, neg_array = separate_arrays(array)
  pos_array = sort_splits(pos_array)
  neg_array = sort_splits(neg_array.map(&:-@)).map(&:-@).reverse
  neg_array + pos_array
end

# sorts the split arrays the sorting method has been separated from the
# main method in order to prevent repeated code.
def sort_splits(array)
  return array if array.empty?

  max_val = array.max
  max_digit = Math.log(max_val, BUCKETS).floor.to_i
  american_flag_sort_helper(array, 0, array.length, max_digit)
  array
end

# separates positive numbers from negative numbers
def separate_arrays(array)
  pos_array = []
  neg_array = []
  array.each do |num|
    num >= 0 ? pos_array << num : neg_array << num
  end
  [pos_array, neg_array]
end

# controller method calculates offsets and swaps items in place
def american_flag_sort_helper(array, start, finish, digit)
  offsets = compute_offsets(array, start, finish, digit)
  swap(array, offsets, start, finish, digit)
  return if digit.zero?

  (0...offsets - 1).each do |i|
    american_flag_sort_helper(array, offsets[i], offsets[i + 1], digit - 1)
  end
end

# computes the locations of each item in the sorted array by counting
# number of items in each bucket, then setting offsets for the buckets
# equal to the number of items in each bucket.
def compute_offsets(array, start, finish, digit)
  counts = Array.new(BUCKETS) { 0 }
  (start...finish).each do |i|
    val = get_radix_val(array[i], digit)
    counts[val] += 1
  end
  offsets = Array.new(BUCKETS) { 0 }
  sum = 0
  (0...BUCKETS).each do |i|
    offsets[i] = sum
    sum += counts[i]
  end
  offsets
end

# calculates the radix value for each item in the starting array
def get_radix_val(x, digit)
  (x / BUCKETS**digit).floor.to_i % BUCKETS
end

# swaps items in place according to the radix value and offset
def swap(array, offsets, start, finish, digit)
  i = start
  next_free = offsets.clone
  cur_block = 0
  while cur_block < BUCKETS - 1
    if i >= start + offsets[cur_block + 1]
      cur_block += 1
      next
    end
    radix_val = get_radix_val(array[i], digit)
    if radix_val == cur_block
      i += 1
      next
    end
    swap_to = next_free[radix_val]
    array[i], array[swap_to] = array[swap_to], array[i]
    next_free[radix_val] += 1
  end
end

shuffled_array = Array.new(10) { rand(-100...100) }

puts "Random Array: #{shuffled_array}"
puts "Sorted Array: #{american_flag_sort(shuffled_array)}"
