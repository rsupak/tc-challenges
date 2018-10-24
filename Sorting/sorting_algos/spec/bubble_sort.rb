require 'pry'

def bubble_sort(array)
  swap = false
  array.each_index do |index|
    next if index + 1 == array.length

    if array[index] >= array[index + 1]
      swap = true
      array[index], array[index + 1] = array[index + 1], array[index]
    end
    bubble_sort(array) if swap
  end
end
