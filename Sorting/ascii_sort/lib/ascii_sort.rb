# ASCII_sort is a form of bucket sort that sorts each strings by their
# ASCII values. The strings are recursively bucketized when longer than
# 1 char && the initial buckets contain more than one value at that bucket
# index.

# main method
def ascii_sort(array)
  sorted_array = []
  count = 0
  # sort into buckets on the first ASCII value in the string 
  # to initialize buckets array
  buckets = bucketize(array, count)

  # shift each bucket into the sorted array in the sorted order
  # if a bucket contains more than one item, bucketize that bucket
  # then shift that bucket into the sorted array.
  until buckets.empty?
    temp = buckets.shift
    if validate(temp)
      sorted_array << temp
    elsif temp.size > 1 && temp.reject { |str| str == temp[0] }.empty?
      sorted_array << temp
    else
      buckets = bucketize(temp, count += 1) + buckets[0..-1]
    end
  end
  sorted_array.flatten
end

# separate array into buckets keyed by the passed in count
# then return separated buckets
def bucketize(array, count)
  buckets = Array.new(256) { [] }
  array.each do |str|
    buckets[str[count].ord] << str
  end
  buckets.reject(&:empty?)
end

# validates bucket size passed to sorted array
# if bucket size is invalide, the array is bucketized again
def validate(bucket)
  bucket.size == 1
end

if $PROGRAM_NAME == __FILE__
  shuffled_array = ['James', 'Kenny', 'Christine', 'Abby', 'Abby',
                    'Alexis', 'kenny', '$$$', '#$#'].shuffle

  puts "Random Array: #{shuffled_array}"
  puts "Sorted Array: #{ascii_sort(shuffled_array)}"
end
