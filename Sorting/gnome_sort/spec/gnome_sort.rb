# Gnome Sort also called Stupid sort is based on the concept
# of a Garden Gnome sorting his flower pots. A garden gnome
# sorts the flower pots by the following method:
# He looks at the flower pot next to him and the previous one;
# if they are in the right order he steps one pot forward,
# otherwise he swaps them and steps one pot backwards.
# If there is no previous pot (he is at the starting of the pot line),
# he steps forwards; if there is no pot next to him (he is at the end
# of the pot line), he is done.
# This implementation of gnome sort follows that same idea,
# but it also keeps track of the last index accessed before 
# starting the swap. Once the swap reaches its final position
# the algorithm jumps to the last accessed position in the array
# to continue the search. Time complexity for gnome sort is most
# commonly O(n^2), but may run closer to O(n) if the list is nearly
# sorted.

def gnome_sort(array)
  index, last_index = 1, 2
  while index < array.length
    if array[index - 1] <= array[index]
      index, last_index = last_index, last_index + 1
    else
      array[index - 1], array[index] = array[index], array[index - 1]
      index -= 1
      index, last_index = last_index, last_index + 1 if index.zero?
    end
  end
  array
end
