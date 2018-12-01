# Counting sort is an algorithm for sorting a collection of objects
# according to keys that are small integers; that is, it is an integer
# sorting algorithm. It operates by counting the number of objects that
# have each distinct key value, and using arithmetic on those counts to
# determine the positions of each key value in the output sequence. Its
# running time is linear in the number of items and the difference between
# the maximum and minimum key values, so it is only suitable for direct use
# in situations where the variation in keys is not significantly greater than
# the number of items. Counting sort's worst time complexity is O(n^2).

def counting_sort(input)
  return input if input.empty?

  min, max = input.minmax
  count = Array.new(max - min + 1, 0)
  input.each do |num|
    count[num - min] += 1
  end
  (min..max).each.with_object([]) do |i, output|
    output.concat([i] * count[i - min])
  end
end
