# Leonardo number generator
def leonardo(leo0 = 1, leo1 = 1, add = 1)
  return to_enum(__method__, leo0, leo1, add) unless block_given?

  loop do
    yield leo0
    leo0, leo1 = leo1, leo0 + leo1 + add
  end
end
LEONARDO_NUMS = leonardo.take(25)

# In computer science, smoothsort is a comparison-based sorting algorithm. 
# A variant of heapsort, it was invented and published by Edsger Dijkstra in 
# 1981. Like heapsort, smoothsort is an in-place algorithm with an upper bound
# of O(n log n), but it is not a stable sort. The advantage of smoothsort is
# that it comes closer to O(n) time if the input is already sorted to some
# degree, whereas heapsort averages O(n log n) regardless of the initial sorted
# state.

# main method
def smooth_sort(array)
  orders = [0]
  trees = 0

  (0...array.length).each do |i|
    if trees > 1 && orders[trees - 2] == orders[trees - 1] + 1
      trees -= 1
      orders[trees - 1] += 1
    elsif trees > 0 && orders[trees - 1] == 1
      orders[trees += 1] = 0
    else
      orders[trees += 1] = 1
    end
    find_and_sift(array, i, trees - 1, orders)
  end
  (array.length - 1).downto(1) do |i|
    if orders[trees - 1] <= 1
      trees -= 1
    else
      right_index = i - 1
      left_index = right_index - LEONARDO_NUMS[orders[trees - 1] - 2]
      trees += 1
      orders[trees - 2] -= 1
      orders[trees - 1] = orders[trees - 2] - 1
      find_and_sift(array, left_index, trees - 2, orders)
      find_and_sift(array, right_index, trees - 1, orders)
    end
  end
  array
end

# find and sift places the current value in the appropriate Leonardo Heap
def find_and_sift(array, index, tree, orders)
  value = array[index]
  while tree > 0
    parent_index = index - LEONARDO_NUMS[orders[tree]]
    break if array[parent_index] <= value

    if orders[tree] > 1
      right_index = index - 1
      left_index = right_index - LEONARDO_NUMS[orders[tree] - 2]
      break if array[parent_index] <= array[left_index] ||
               array[parent_index] <= array[right_index]
    end

    array[index] = array[parent_index]
    index = parent_index
    tree -= 1
  end
  array[index] = value
  sift_down(array, index, orders[tree])
end

# once the value is in the correct Leonardo Heap, the value is sifted
# down into the correct branch of the tree.
def sift_down(array, index, order)
  value = array[index]
  while order > 1
    right_index = index - 1
    left_index = right_index - LEONARDO_NUMS[order - 2]
    break if value >= array[left_index] && value >= array[right_index]

    if array[left_index] <= array[right_index]
      array[index] = array[right_index]
      index = right_index
      order -= 2
    else
      array[index] = array[left_index]
      index = left_index
      order -= 1
    end
  end
  array[index] = value
end

# Test block runs when file is run.
if $PROGRAM_NAME == __FILE__
  shuffled_array = Array.new(10) { rand(-1000...1000) }
  puts "Random Array: #{shuffled_array}"
  puts "Sorted Array: #{smooth_sort(shuffled_array)}"
end
