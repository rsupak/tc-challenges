require 'pry'

# merge sort relies dividing the incoming array by half, until it reaches
# atomically (smallest) possible number of items in the array.
# Then it compares each of those atomic pieces, rebuilding them into left
# sorted array at each comparison.

def merge_sort(collection)
  p collection
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
  p sorted + left + right
end

shuffled_array = [-20, 24, -17, -72, 58, -98, 48, 10, 59, 10]

puts "Random Array: #{shuffled_array}"
puts "Sorted Array: #{merge_sort(shuffled_array)}"
