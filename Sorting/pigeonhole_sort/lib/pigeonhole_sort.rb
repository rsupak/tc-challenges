# Pigeonhole sorting is a sorting algorithm that is suitable for sorting lists
# of elements where the number of elements (n) and the length of the range of
# possible key values (N) are approximately the same. It requires O(n + N)
# time. It is similar to counting sort, but differs in that it "moves items
# twice: once to the bucket array and again to the final destination [whereas]
# counting sort builds an auxiliary array then uses the array to compute each
# item's final destination and move the item there."
def pigeonhole_sort(array)
  return array if array.empty?

  temp = array.dup
  min = temp.min
  size = temp.max - min + 1
  buckets = Array.new(size) { 0 }

  # increment the bucket count if a value meets bucket criteria
  # (bucket[index] == num - min)
  temp.each do |num|
    buckets[num - min] += 1
  end

  # set index to initialize access at 0 (this is the starting location for
  # replacing values in the temporary array.) Then iterate over the range
  # of buckets size, replacing each item in the array at the index value
  # with the value calculated by the bucket index from the minimum value per
  # count of the bucket index.
  index = 0
  (0...size).each do |count|
    until buckets[count].zero?
      buckets[count] -= 1
      temp[index] = count + min
      index += 1
    end
  end

  temp
end

shuffled_array = Array.new(10) { rand(-100...100) }

puts "Random Array: #{shuffled_array}"
puts "Sorted Array: #{pigeonhole_sort(shuffled_array)}"
