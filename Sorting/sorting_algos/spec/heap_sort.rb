def heap_sort(array)
  build_heap(array)
  last = array.size - 1
  until last <= 0
    p array
    swap(array, 0, last)
    last -= 1
    p build_heap(array[0..last])
    array[0..last] = build_heap(array[0..last])
  end
  array
end

def build_heap(array)
  array.each_index do |i|
    if array[i] > array [i / 2]
      swap(array, i, i / 2)
      build_heap(array)
    end
  end
end

def swap(array, first, last)
  array[first], array[last] = array[last], array[first]
end

shuffled_array = Array.new(10) { rand(-100...100) }

puts "Random Array: #{shuffled_array}"
puts "Sorted Array: #{heap_sort(shuffled_array)}"
