def counting_sort(array)
  min, max = array.minmax
  count = Array.new(max - min + 1, 0)
  array.each { |num| count[num - min] += 1 }
  (min..max).each.with_object([]) do |i, arr|
    arr.concat([i] * count[i - min])
  end
end

arr = [6,5,4,2,3,1]
p counting_sort(arr)
