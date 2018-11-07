# Selection Sort is an in place sorting algorithm.
# It does this by creating a sorted subsection of the array.
# It systematically checks each item in the array against
# the value at the location being sorted. If the value is less than
# the value at the sorting location, it swaps the values.
# When it reaches the end of the array, it moves up to the next
# sorting location checks the unsorted values against the value 
# at the next sorting location.

def selection_sort(array)
  (0...array.length).each do |i|
    min = i
    ((i + 1)...array.length).each do |j|
      array[j], array[min] = array[min], array[j] if array[j] < array[min]
    end
  end
  array
end
