# Set Min an Max Run Size
MIN = 3
MAX = 32

# tim_sort
def tim_sort(array)
  runs, sorted_runs = [], []
  
end

# used to combine sorted Runs
def merge_sort(collection)
  return collection unless collection.size > 1

  mid = collection.size / 2
  left, right = merge_sort(collection[0...mid]), merge_sort(collection[mid..-1])

  merge(left, right)
end

# helper method to combine the left and right arrays in sorted order
def merge(left, right)
  sorted = []
  while [left, right].none?(&:empty?)
    sorted << (left[0] < right[0] ? left.shift : right.shift)
  end
  sorted + left + right
end

# merges sub-array <= size of Run
def insertion_sort(array)
  array.each_index do |index|
    key = array[index]

    check = index - 1
    while check >= 0 && key < array[check]
      array[check], array[check + 1] = array[check + 1], array[check]
      check -= 1
    end
  end
  array
end

shuffled_array = Array.new(10) { rand(-100...100) }

puts "Random Array: #{shuffled_array}"
puts "Sorted Array: #{insertion_sort(shuffled_array)}"
