# Josephus Permutation
# create a function that returns a Josephus permutation, taking as parameters
# the initial array/list of items to be permuted as if they were in a circle
# and counted out every k places until none remained.

def josephus(arr, skip)
  return [] if arr.empty?

  temp_arr = arr.clone
  result = []
  current_index = 0
  until temp_arr.empty?
    current_index = current_index + skip - 1
    current_index %= temp_arr.length if current_index >= temp_arr.length
    result << temp_arr.delete_at(current_index)
  end
  result
end

# test method
if $PROGRAM_NAME == __FILE__
  p josephus([1, 2, 3, 4, 5, 6, 7], 3)
  p josephus([1, 2, 3, 4, 5, 6, 7, 8, 9, 10], 1)
  p josephus([1, 2, 3, 4, 5, 6, 7, 8, 9, 10], 2)
  p josephus(%w[C o d e W a r s], 4)
  p josephus([], 3)
  p josephus([1], 1)
  p josephus([7, 1, 2, 4, 6, 5], 10)
end
