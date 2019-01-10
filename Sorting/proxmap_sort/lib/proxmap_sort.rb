# ProxmapSort, or Proxmap sort, is a sorting algorithm that works by
# partitioning an array of data items, or keys, into a number of "subarrays"
# (termed buckets, in similar sorts). The name is short for computing a
# "proximity map," which indicates for each key K the beginning of a subarray
# where K will reside in the final sorted order. Keys are placed into each
# subarray using insertion sort. If keys are "well distributed" among the
# subarrays, sorting occurs in linear time. The computational complexity
# estimates involve the number of subarrays and the proximity mapping function,
# the "map key," used. It is a form of bucket and radix sort.

MAX_VALUE = 100

# main method
def proxmap_sort(array)
  return array if array.empty?

  hit_count = make_hitcount_array(array)
  prox_map = make_proxmap(hit_count)
  locations = make_locations_array(array, prox_map)
  sort_array(array, locations)
end

# build the hitcount array
# determines how many keys will map to the same sub array
def make_hitcount_array(array)
  hit_count = Array.new(array.max + 1) { 0 }
  array.each do |num|
    if num <= 0
      hit_count[0] += 1
    else
      hit_count[num] += 1
    end
  end
  hit_count
end

# build proximity map
# determines where each sub array will begin in the destination
# array so that each bucket is exactly the right size to hold
# all the keys that will map to it
def make_proxmap(array)
  running_total = 0
  prox_map = Array.new(array.length) { 0 }
  array.each_index do |i|
    if array[i].zero?
      prox_map[i] = -1
    else
      prox_map[i] = running_total
      running_total += array[i]
    end
  end
  prox_map
end

# build locations array
# for each key, compute the subarray it will map to
def make_locations_array(array, prox_map)
  location = Array.new(array.length)
  location.each_index do |i|
    location[i] = prox_map[map_keys(array[i])]
  end
end

# places array value into new_array, insertion sorts new_array sub-array
# if sub-array not empty, returns flattened new_array in sorted order
def sort_array(array, locations)
  new_array = Array.new(array.length) { [] }
  array.each_index do |i|
    new_array[locations[i]] << array[i]
    insertion_sort(new_array[locations[i]]) unless new_array[locations[i]].empty?
  end
  new_array.flatten
end

# maps key locations in location array
# if value <= 0, maps to location 0
def map_keys(num)
  return 0 if num <= 0

  num % MAX_VALUE
end

# helper method to sort collisions
def insertion_sort(array)
  1.upto(array.length - 1) do |i|
    value = array.delete_at(i)
    j = i - 1
    j -= 1 while j >= 0 && value < array[j]
    array.insert(j + 1, value)
  end
  array
end

if $PROGRAM_NAME == __FILE__
  shuffled_array = Array.new(10) { rand(-10..100) }
  puts "Random Array: #{shuffled_array}"
  puts "Sorted Array: #{proxmap_sort(shuffled_array)}"
end
