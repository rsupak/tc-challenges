def gnome_sort(array)
  index, last_index = 1, 2
  while index < array.length
    if array[index - 1] <= array[index]
      index, last_index = last_index, last_index + 1
    else
      array[index - 1], array[index] = array[index], array[index - 1]
      index -= 1
      index, last_index = last_index, last_index + 1 if index.zero?
    end
  end
  array
end

# shuffled_array = Array.new(10) { rand(-100...100) }

# puts "Random Array: #{shuffled_array}"
# puts "Sorted Array: #{gnome_sort(shuffled_array)}"
