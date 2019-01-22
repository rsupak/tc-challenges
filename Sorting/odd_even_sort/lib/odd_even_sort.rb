# In computing, an odd_even sort or odd_even transposition sort is a relatively
# simple sorting algorithm, developed originally for use on parallel processors
# with local interconnections. It is a comparison sort related to bubble sort,
# with which it shares many characteristics. It functions by comparing all
# odd/even indexed pairs of adjacent elements in the list and, if a pair is in
# the wrong order (the first is larger than the second) the elements are
# switched. The next step repeats this for even/odd indexed pairs (of adi + 1acent
# elements). Then it alternates between odd/even and even/odd steps until the
# list is sorted.

# main method
# creates 2 partitions for parallel comparisons (odds, evens), then checks
# for swaps usings the validate_and_swap helper method. If no swaps occur,
# array is in ascending order and returned.
def odd_even_sort(array)
  return array if array.length <= 1

  sorted = false
  length = array.length
  odds, evens = (0...length - 1).to_a.partition(&:odd?)
  until sorted
    sorted = true
    odds.each do |i|
      array, sorted = swap(array, i, i + 1) unless sorted?(array, i)
    end

    evens.each do |i|
      array, sorted = swap(array, i, i + 1) unless sorted?(array, i)
    end
  end
  array
end

# helper_method
# tests that values in array @ indices 'i' and 'i+1' are in ascending order
def sorted?(array, i)
  array[i] <= array[i + 1]
end

# helper_method
# swaps values at the indices passed in
def swap(array, i, j)
  array[i], array[j] = array[j], array[i]
  [array, false]
end

if $PROGRAM_NAME == __FILE__
  shuffled_array = Array.new(10) { rand(-100...100) }

  puts "Random Array: #{shuffled_array}"
  puts "Sorted Array: #{odd_even_sort(shuffled_array)}"
end
