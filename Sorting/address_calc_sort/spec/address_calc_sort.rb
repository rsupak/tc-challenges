require_relative 'node'
require_relative 'linked_list'

# Added a size constant in order to allow for a single change to be
# implemented for sorting arrays whose range exceeds 100.
SIZE = 11

# sorting method
# address_calculation_sort is a sorting method that uses an address table
# into which items are placed using a hashing function. The table itself is
# can either be an array of arrays or an array of linked lists,very similar
# to the buckets in bucket sort, but the numbers passed into the table are
# sorted concurrently to being passed into the table rather than after the
# buckets have been filled. This is done using an insertion sort during
# the insertion into the linked list.
def address_calc_sort(array)
  address_table = Array.new(SIZE) { LinkedList.new }
  temp = array.dup # duplicate the array to prevent mutation

  # hash the array into the address table
  temp.each do |num|
    address = hash_function(num)
    address_table[address].insert(num)
  end

  # ***delete before submit!***
  # print address table
  address_table.each.with_index do |list, i|
    next if list.head.nil?
    print 'Address ' + i.to_s + ': '
    list.print_list
    puts
  end

  # replace values in array with values from the address_table
  # each address is exhausted before moving on to the next,
  # and because the nodes are inserted in sorted order, as
  # the numbers are placed back into the array, they too should
  # be in sorted order.
  index = 0
  (0...SIZE).each do |i|
    current = address_table[i].head
    until current.nil?
      temp[index] = current.data
      index += 1
      current = current.next
    end
  end
  temp
end

# hash function returns an address for the number to be placed in the hash table
# In order for the hash to deal with negative numbers, all negative numbers are
# being placed in the first linked list of the address_table. This ensures that
# they will be placed first in the sorted array. There is a drawback to sorting
# hashing negative numbers in this manner, as it creates a greater cost for each
# negative number passed in from the original array.
def hash_function(num)
  num > 0 ? (num / SIZE) + 1 : 0
end

shuffled_array = Array.new(10) { rand(-10..100) }

puts "Random Array: #{shuffled_array}"
puts "Sorted Array: #{address_calc_sort(shuffled_array)}"
