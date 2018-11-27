import timeit
import random

def binary_search_iterative(array, item):
  first = 0
  last = len(array) - 1
  found = False

  while first <= last and not found:
    mid = (first + last) // 2
    if array[mid] == item:
      found = True
    else:
      if item < array[mid]:
        last = mid - 1
      else:
        first = mid + 1
        
  return found

def binary_search_recursive(array, item):
  if len(array) == 0:
    return False
  else:
    mid = len(array) // 2
    if array[mid] == item:
      return True
    else:
      if item < array[mid]:
        return binary_search_recursive(array[:mid], item)
      else:
        return binary_search_recursive(array[mid + 1], item)

ten = list(range(1, 11))
hundred = list(range(1, 101))
thousand = list(range(1, 1001))

