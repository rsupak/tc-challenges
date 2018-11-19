def strand_sort(array)
  result = []
  until array.empty?
    value = array.first
    sublist, array = array.partition { |val| value = val if value <= val }
    puts "Result #{result}"
    puts "Sublist: #{sublist}"
    result += sublist.shift(sublist.length) if result.empty?
    until sublist.empty?
      elem = sublist.shift
      insert_at = result.bsearch_index { |i| i > elem }
      result.insert(insert_at, elem)
    end
  end
  result
end

shuffled_array = Array.new(20) { rand(-100...100) }
puts "Random Array: #{shuffled_array}"
puts "Sorted Array: #{strand_sort(shuffled_array)}"
