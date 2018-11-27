require 'benchmark'

# The following methods will be used to test the time efficiency
# of binary search methods which rund either iteratively or recursively
# Benchmark will be used to test the time it takes for each program to
# run.

# iterative search
def binary_search_iterative(array, item)
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

# recursive search
def binary_search_recursive(array, item)
  return false if array.length.zero?

  mid = array.length / 2
  return true if array[mid] == item

  if item < array[mid]
    binary_search_recursive(array[0..mid], item)
  else
    binary_search_recursive(array[mid + 1...array.length], item)
  end
end

ten = (1..10).to_a
hundred = (1..100).to_a
thousand = (1..1000).to_a
n = 3

ten_iterative = binary_search_iterative(ten, 6)
hundred_iterative = binary_search_iterative(hundred, 36)
thousand_iterative = binary_search_iterative(thousand, 674)
ten_recursive = binary_search_recursive(ten, 6)
hundred_recursive = binary_search_recursive(hundred, 36)
thousand_recursive = binary_search_recursive(thousand, 674)

# I'm using the .bmbm method to create a rehearsal run for
# each of the methods benchmarked below. I've also set
# a times marker to run each test `n` number of times
# this allows for a more explicit measurement of which method
# runs faster, by dramatically increasing the number or test
# that can be made with a simple change. The challenge asked for
# each test to be run 3 times, but with such small searches,
# the time it took either to complete is minimal. The variable
# above 'n' has been set to run each test 3 times, but can easily
# be change to run the benchmark any number of iterations to show
# a greater difference in the overal runtime.

Benchmark.bmbm do |benchmark|
  benchmark.report('10 Iterative') do
    n.times do
      ten_iterative
    end
  end
  benchmark.report('10 Recursive') do
    n.times do
      ten_recursive
    end
  end
  benchmark.report('100 Iterative') do
    n.times do
      hundred_iterative
    end
  end
  benchmark.report('100 Recursive') do
    n.times do
      hundred_recursive
    end
  end
  benchmark.report('1000 Iterative') do
    n.times do
      thousand_iterative
    end
  end
  benchmark.report('1000 Recursive') do
    n.times do
      thousand_recursive
    end
  end
end
