# Spaghetti sort is a linear-time, analog algorithm for sorting
# a sequence of items, introduced by Alexander Dewdney in his Scientific
# American column. This algorithm sorts a sequence of items requiring O
# stack space in a stable manner. It requires a parallel processor.

def spaghetti_sort(arr)
  return arr if arr.empty?

  # simulates placing spaghetti in hand
  min = arr.min
  size = arr.max - min + 1

  # simulates lowering spaghetti to table
  # by placing each rod/rods into a bucket of size rod
  # O(n) time
  buckets = Array.new(size) { 0 }
  arr.each do |num|
    buckets[num - min] += 1
  end

  # simulates lowering hand to the spaghetti rods
  # places longest rod into array on each lowering
  # O(1)
  sorted_arr = []
  (size - 1).downto(0) do |count|
    until buckets[count].zero?
      buckets[count] -= 1
      sorted_arr.unshift(count + min)
    end
  end

  sorted_arr
end

# Test method
if $PROGRAM_NAME == __FILE__
  shuffled_array = Array.new(10) { rand(-100..100) }
  puts "Random Array: #{shuffled_array}"
  puts "Sorted Array: #{spaghetti_sort(shuffled_array)}"
end
