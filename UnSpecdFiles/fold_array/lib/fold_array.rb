# In this challenge you have to write a method that folds a given array
# of integers by the middle x-times. For example when [1,2,3,4,5] is folded
# 1 times, it gives [6,6,3] and when folded two times it gives [9,6].

def fold_array(array, folds)
  return array if folds.zero?

  new_array = []
  new_array << array.shift + array.pop until array.length <= 1
  new_array << array.pop if array.length == 1
  fold_array(new_array, folds - 1)
end

if $PROGRAM_NAME == __FILE__
  arr = [1, 2, 3, 4, 5]
  p fold_array(arr, 3)
end
