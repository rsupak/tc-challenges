# main method
# ascii_sort sorts each string in the input array by the ascii value of the
# first char in each string. it does this by creating a hash of each string
# keyed by the ascii values of the first char in the string. Then if there
# are multiple strings keyed into the bucket, it keys the sub-array by the
# next char in the string until the strings are in sorted order, (each sub
# array only contains 1 item. Finally it returns the flattened array.
def ascii_sort(array)
  index = 0
  temp = asciitize(array, index)
  temp.each.with_index do |arr, i|
    temp[i] = asciitize(arr, index += 1).flatten if arr.length > 1
  end
  temp.flatten
end

# sorts hashed array by ascii keys
def sort_keys(hash)
  key_array = quick_sort(hash.keys)
  temp = []
  key_array.each do |key|
    temp << hash[key]
  end
  temp
end

# hashes the array by ascii value
def ascii_hashify(array, index)
  hash = {}
  array.each do |str|
    key = str[index].ord
    if hash[key].nil?
      hash[key] = [str]
    else
      hash[key] << str
    end
  end
  hash
end

# sorts the ascii values of the first character in the string after hashing
# using a sort method here because the hash is unsorted
def quick_sort(array)
  return [] if array.empty?

  pivot = array.delete_at(rand(array.size))
  left, right = array.partition { |num| pivot > num }

  [*quick_sort(left), pivot, *quick_sort(right)]
end

# arranges each string by ascii value by sorting the keys into buckets
# keyed by the ascii value at the given index
def asciitize(array, index)
  hash = ascii_hashify(array, index)
  sort_keys(hash)
end

if $PROGRAM_NAME == __FILE__
  shuffled_array = ['Jeremy', 'Kenny', '#$#', '$$$', 'Christine',
                    'Abby', 'Alexis', 'kenny', 'Jacob'].shuffle

  puts "Random Array: #{shuffled_array}"
  puts "Sorted Array: #{ascii_sort(shuffled_array)}"
end
