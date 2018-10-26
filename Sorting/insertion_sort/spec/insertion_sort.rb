# insertion sort grabs the number at the current index
# in the array (key), then compares it to each index less than
# the current index (check) until it finds an index value less
# than the key.

def insertion_sort(array)
  array.each_index do |index|
    key = array[index]

    check = index - 1
    while check >= 0 && key < array[check]
      array[check], array[check + 1] = array[check + 1], array[check]
      check -= 1
      p array
    end
  end
end

array = [12, 11, 13, -11, 5, 6]
p insertion_sort(array)
