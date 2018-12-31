# Cycle sort is an in-place sorting Algorithm, unstable sorting algorithm, a
# comparison sort that is theoretically optimal in terms of the total number
# of writes to the original array.
# It is optimal in terms of number of memory writes. It minimizes the number
# of memory writes to sort (Each value is either written zero times, if its
# already in its correct position, or written one time to its correct position.)
# https://en.wikipedia.org/wiki/Cycle_sort

# A duplicate array is not created for this algorithm because the primary purpose
# is to prevent the number of memory writes while returning a sorted
def cycle_sort(array)
  writes = 0

  # Loop through the array to find cycles to rotate.
  (0...array.length - 1).each do |cycle_start|
    item = array[cycle_start]

    # Find where to put the item.
    position = cycle_start
    (cycle_start + 1...array.length).each do |index|
      position += 1 if array[index] < item
    end

    # If the item is already there, this is not a cycle.
    next if position == cycle_start

    position += 1 while item == array[position]
    array[position], item = item, array[position]
    writes += 1

    # Rotate the rest of the cycle.
    while position != cycle_start

      # Find where to put the item.
      position = cycle_start
      (cycle_start + 1...array.length).each do |index|
        position += 1 if array[index] < item
      end

      # Put the item there or right after any duplicates.
      position += 1 while item == array[position]
      array[position], item = item, array[position]
      writes += 1
    end
  end
  puts "Total writes: #{writes}"
  array
end

shuffled_array = Array.new(10) { rand(-100...100) }

puts "Random Array: #{shuffled_array}"
puts "Sorted Array: #{cycle_sort(shuffled_array)}"
