# Strand sort is a merge sort variant that builds strands of sorted subarrays
# then merges the strand into the main sorted sub array. The strands are build
# by setting the initial comparison value as the first item in the array,
# then it iterates over the array until it finds a number greater than the
# value then adds the value to the strand array sets the value to the found
# number. It continues build the strand with greater values until the end of
# the array. Then it merges the strand into the sorted final array.

def strand_sort(array)
  temp = array.dup
  result = []
  until temp.empty?
    value = temp.first
    sublist, temp = temp.partition { |val| value = val if value <= val }
    result += sublist.shift(sublist.length) if result.empty?
    result = binary_sort(result, sublist)
  end
  result
end

# helper method merges result and sublist arrays using binary insertion sort
def binary_sort(result, sublist)
  until sublist.empty?
    elem = sublist.shift
    insert_at = result.bsearch_index { |i| i > elem }
    result.insert(insert_at, elem)
  end
  result
end
