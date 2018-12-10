# finds the longest consecutive string in an array of strings
# after joining a slice of the array. ``
def longest_consec(array, num)
  consecutive_string = ''
  start = 0
  stop = num
  return consecutive_string if num <= 0 || num > array.size

  while stop <= array.size
    temp = array[start...stop].join
    consecutive_string = temp if temp.size > consecutive_string.size
    start += 1
    stop = start + num
  end
  consecutive_string
end
