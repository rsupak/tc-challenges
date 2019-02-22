# A comparison sort is a type of sorting algorithm that only reads the list
# elements through a single abstract comparison operation (often a "less than
# or equal to" operator or a three-way comparison) that determines which of two
# elements should occur first in the final sorted list. The only requirement is
# that the operator obey two of the properties of a total order:
# 1. if a ≤ b and b ≤ c then a ≤ c (transitivity)
# 2. for all a and b, either a ≤ b or b ≤ a (totalness or trichotomy).

def comparison_sort(array)
  return [] if array.empty?

  pivot = array.delete_at(rand(array.size))
  left, right = array.partition { |num| pivot > num }

  [*comparison_sort(left), pivot, *comparison_sort(right)]
end

# Test block
if $PROGRAM_NAME == __FILE__
  shuffled_array = Array.new(10) { rand(-1000...1000) }
  puts "Random Array: #{shuffled_array}"
  puts "Sorted Array: #{comparison_sort(shuffled_array)}"
end
