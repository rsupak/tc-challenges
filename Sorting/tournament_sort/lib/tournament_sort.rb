require_relative 'pqueue'
require 'byebug'

# priority queue max size
MAX_SIZE = 10

# Tournament sort is a sorting algorithm. It improves upon the naive selection
# sort by using a priority queue to find the next element in the sort. In the
# naive selection sort, it takes O(n) operations to select the next element of
# n elements; in a tournament sort, it takes O(log n) operations (after
# building the initial tournament in O(n)). Tournament sort is a variation of
# heapsort.

# main method
def tournament_sort(array)
  return optimal_tourney_sort(array) if array.size <= MAX_SIZE

  bracketize(array)
end

# A priority queue is created out to the array up to the max_size.
# Winners and loser brackets (arrays) are created to hold the tournament
# results as the priority queue is emptied. The winner bracket is the
# primary sorted array. The loser bracket is used to hold the items from
# the original array which will not conform to the sorted queue. This is
# determined by the last item in the winners bracket. If the item to be added
# to the priority queue is smaller than the last item in the winners bracket,
# there is no way for it to be placed in sorted order during that iteration.
# The array is sorted when there are no longer items in the losers bracket.
# Once the excess items are sorted into winners or losers bracket, the
# remaining queue is placed into the winners bracket in sorted order.
# If sorted array is not returned, the winners bracket is concatenated with the
# losers bracket. The losers bracket should prioritize correctly now because
# the larger items should be at the end of the winners bracket. Then the
# array is recursively 'bracketized' until the losers bracket is empty.
def bracketize(array)
  parity_check = array.size
  pq = PriorityQueue.new
  pq << array.shift until pq.size == MAX_SIZE
  winners = [pq.remove_min]
  losers = []
  until array.empty?
    pq << array.shift until pq.size == MAX_SIZE
    # debugger
    if winners.last < pq.peek && pq.size > 1
      winners << pq.remove_min
    else
      losers << pq.remove_min
    end
    pq << array.shift
  end
  winners << pq.remove_min until pq.size == 1
  return winners if winners.size == parity_check

  bracketize(losers + winners)
end

# if array size is less than MAX_SIZE for priority queue,
# optimal_tourney_sort uses the design of the priority queue
# to sort the array.
def optimal_tourney_sort(array)
  sorted_array = []
  pq = PriorityQueue.new
  array.each { |num| pq << num }
  sorted_array << pq.remove_min until pq.size == 1
  sorted_array
end

# Test block
if $PROGRAM_NAME == __FILE__
  100.times do
    shuffled_array = Array.new(5) { rand(-100...100) }
    puts "Random Array: #{shuffled_array}"
    puts "Sorted Array: #{tournament_sort(shuffled_array)}"
    puts
  end
end
