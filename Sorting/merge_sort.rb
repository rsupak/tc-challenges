# merge sort relies dividing the incoming array by half, until it reaches
# atomically (smallest) possible number of items in the array.
# Then it compares each of those atomic pieces, rebuilding them into left
# sorted array at each comparison.

def merge_sort(collection)
  p collection
  return collection unless collection.size > 1

  mid = collection.size / 2
  left, right = merge_sort(collection[0...mid]), merge_sort(collection[mid..-1])
  sorted = []

  while [left, right].none?(&:empty?)
    sorted << (left[0] < right[0] ? left.shift : right.shift)
  end
  sorted + left + right
end

shuffled_array = Array.new(10) { rand(-100...100) }

puts "Random Array: #{shuffled_array}"
puts "Sorted Array: #{merge_sort(shuffled_array)}"
