require 'pry'

def bubble_sort(array)
  swap = false
  array.each_index do |index|
    next if index + 1 == array.length

    if array[index] >= array[index + 1]
      swap = true
      array[index], array[index + 1] = array[index + 1], array[index]
    end
    p array
    bubble_sort(array) if swap
  end
end

if $PROGRAM_NAME == __FILE__
  shuffled_array = Array.new(10) { rand(-0...100) }
  puts "Random Array: #{shuffled_array}"
  puts "Sorted Array: #{bubble_sort(shuffled_array)}"
end
