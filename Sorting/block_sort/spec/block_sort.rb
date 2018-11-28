def block_sort(array)
  power_of_two = floor_power_of_two(array.size)
  scale = array.size/power_of_two
  mid = array.size/2
  a, b = array[0...mid], array[mid...array.length]
  a = insertion_sort(a)
  b = insertion_sort(b)
  until a.empty?
    temp = a.shift
    if temp < b.last
      b.insert(b.index { |num| num > temp }, temp)
    else
      b << temp
    end
  end
  p a
  p b
end

def swap(a, b)
  a, b = b, a
  [a, b]
end

def block_swap
end

def binary_search(array, item)
  first = 0
  last = array.length - 1
  found = false

  while first <= last && !found
    mid = (first + last) / 2
    if array[mid] == item
      found = true
    else
      item < array[mid] ? last = mid - 1 : first = mid + 1
    end
  end
  found
end

def linear_search(array, item)
  array.index(item).nil? ? false : true
end

def insertion_sort(array)
  array.each_index do |index|
    key = array[index]

    check = index - 1
    while check >= 0 && key < array[check]
      array[check], array[check + 1] = array[check + 1], array[check]
      check -= 1
    end
  end
end

def rotate(array, amount, range)
end

def floor_power_of_two(num)
  num |= num >> 1
  num |= num >> 2
  num |= num >> 4
  num |= num >> 8
  num |= num >> 16
  num |= num >> 32
  num - (num >> 1)
end

a = [6,2,5,3,1,4]
block_sort(a)
