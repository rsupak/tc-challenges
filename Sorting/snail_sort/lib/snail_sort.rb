# Snail Sort
# Given an n x n array, return the array elements arranged from outermost elements 
# to the middle element, traveling clockwise. Main method validates passed in array
# then passes array to sorting method.
def snail_sort(array)
  array.any? do |elem|
    return 'there are no digits in the input arrays' if elem.empty?

    if elem.size != array[0].size
      return 'the number inputs in each input array must be the same'
    end
  end

  sort(array)
end

# Sorting method takes advantage of built in Array methods .shift, .transpose, and
# .reverse. Using these methods, we traverse the 2-D array and return the sorted array.
def sort(array)
  temp = array.dup

  return [] if temp.empty?

  temp.shift + sort(temp.transpose.reverse)
end
