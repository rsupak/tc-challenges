# Flashsort is a distribution sorting algorithm showing linear computational
# complexity O(n) for uniformly distributed data sets and relatively little
# additional memory requirement. The basic idea behind flashsort is that in a
# data set with a known distribution, it is easy to immediately estimate where
# an element should be placed after sorting when the range of the set is known.
# For example, if given a uniform data set where the minimum is 1 and the maximum
# is 100 and 50 is an element of the set, its reasonable to guess that 50 would
# be near the middle of the set after it is sorted. This approximate location is
# called a class. 
def flash_sort(array)
  max = 0
  min = array[0]
  length = array.length # n

  factor = (0.43 * length).to_i # m

  # memory allocated to store the upper bounds of each class
  auxiliary_vector = Array.new(factor) { 0 } # L

  # classification
  # flashsort depends on the efficient classification of numbers
  # into appropriate locations in the original array, the array is scanned
  # once in order to find the size of each class. The auxiliary vector 
  # is used to keep track of the insertion locations for the maximum amounts
  # in each class. Once the classes are identified and the maximum values
  # placed, the array is then passed to the permutations step.
  (1...length).each do |i|
    min = array[i] if array[i] < min
    max = i if array[i] > array[max]
  end

  return array if min == array[max]

  clas = (factor - 1) / (array[max] - min).to_f

  (0...length).each do |j|
    k = (clas * (array[j] - min)).to_i
    auxiliary_vector[k] += 1
  end

  (1...factor).each do |p|
    auxiliary_vector[p] = auxiliary_vector[p] + auxiliary_vector[p - 1]
  end

  array[max], array[0] = array[0], array[max]

  # permutation
  # The permutation step places the remaining numbers into their appropriate
  # classes. Once each of the numbers is set in its appropriate class, the array
  # is passed down to the insertion sort step.
  move = 0
  j = 0
  k = factor - 1

  while move < (length - 1)
    while j > (auxiliary_vector[k] - 1)
      j += 1
      k = (clas * (array[j] - min))
    end
    break if k < 0

    flash = array[j]
    while j != auxiliary_vector[k]
      k = (clas * (flash - min))
      hold = array[t = (auxiliary_vector[k] -= 1)]
      array[t] = flash
      flash = hold
      move += 1
    end
  end

  # insertion
  # The classes are finally sorted using insertion sort.
  (1...length).each do |j|
    hold = array[j]
    i = j - 1
    while i >= 0 && array[i] > hold
      array[i + 1] = array[i]
      i -= 1
    end
    array[i + 1] = hold
  end

  array
end

shuffled_array = Array.new(10) { rand(-100...100) }
puts "Random Array: #{shuffled_array}"
puts "Sorted Array: #{flash_sort(shuffled_array)}"
