# comb sort is an exchange sort that improves the array access time over
# bubble sort. One of the greatest shortcomings of bubble sort is when the
# smallest values are gathered toward the end of the array ('turtles'). Bubble
# sort has a constant gap comparison of 1, and the turtles increase the 
# look-back over the entire array. Comb sort attempts to minimize this
# issue by allowing for a greater gap comparison which would then bring the
# turtles toward the middle and beginning of the array during each pass.

def comb_sort(array)
  gap = array.size
  swaps = true
  while gap > 1 || swaps
    gap = [1, (gap / 1.25).to_i].max
    swaps = false
    0.upto(array.size - gap - 1) do |i|
      if array[i] > array[i + gap]
        array[i], array[i + gap] = array[i + gap], array[i]
        swaps = true
      end
    end
  end
  array
end
