def ascii_sort(array)
  sorted_array = []

  # sort into buckets on the str[0] value first
  buckets = bucketize(array)

  # shift each bucket into the sorted array in the sorted order
  # if a bucket contains more than one item, bucketize that bucket
  # then shift that bucket into the sorted array.
  until buckets.empty?
    temp = buckets.shift
    if validate(temp)
      sorted_array << temp
    else
      buckets = bucketize(temp, 1) + buckets[1..-1]
    end
  end
  sorted_array.flatten
end

def bucketize(array, count = 0)
  p array
  p count
  buckets = Array.new(256) { [] }
  array.each do |str|
    buckets[str[count].ord] << str
  end
  buckets = buckets.reject(&:empty?)
  p buckets
  return buckets if count.zero?
  return buckets unless buckets.any? { |arr| arr.length > 1 }

  until buckets.select { |arr| arr.length > 1 }.empty?
    count += 1
    bucketize(buckets.flatten, count)
  end
  buckets
end

def validate(bucket)
  bucket.length == 1
end

if $PROGRAM_NAME == __FILE__
  shuffled_array = ['Meremy', 'Kenny', '#$#', '$$$', 'Christine',
                    'Abby', 'Abexis', 'kenny', 'Jacob'].shuffle

  puts "Random Array: #{shuffled_array}"
  puts "Sorted Array: #{ascii_sort(shuffled_array)}"
end
