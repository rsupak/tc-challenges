require 'pry'

def bucket_sort(array)
  buckets = fill_buckets(array, 3)
  sorter(buckets)
  buckets.reduce(:+)
end

def fill_buckets(array, count)
  buckets = Array.new(count) { [] }
  array.each do |num|
    if num <= array.max / count
      buckets[0] << num
    elsif num <= 2 * array.max / count
      buckets[1] << num
    else
      buckets[2] << num
    end
  end
  buckets
end

def sorter(buckets)
  buckets.each do |bucket|
    bubble_sort(bucket)
  end
end

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
