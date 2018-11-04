def selection_sort(array)
  n = array.length
  (0...n).each do |i|
    min = i
    ((i + 1)...n).each do |j|
      p array
      array[j], array[min] = array[min], array[j] if array[j] < array[min]
    end
  end
  array
end

shuffled_array = Array.new(10) { rand(-100...100) }
puts "Shuffle: #{shuffled_array}"

puts selection_sort(shuffled_array).to_s
