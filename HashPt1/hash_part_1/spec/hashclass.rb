require_relative 'hash_item'

class HashClass

  # initialize class as an array of empty arrays (buckets)
  def initialize(size)
    @array = Array.new(size) { [] }
  end
  
  # set hash_item using key and value
  def []=(key, value)

    # hash_item is a new HashItem object
    # initialized with key and value passed in
    hash_item = HashItem.new(key, value)
    bucket = index(key, size)   # bucket is selected by hashing the key
    dynamic_array = @array[bucket]
    find_item = dynamic_array.find { |item| # search bucket for hash_item by key
      item.key == key
    }
    if find_item
      if find_item.value != value # if there is a key collision with different values
        resize  # resize the array of buckets (size * 2)
      end
      @array[bucket] << hash_item # push new hash_item into the bucket
    else
      @array[bucket] << hash_item # push hash_item into bucket if not collisions
    end
    
  end

  # method to get value with using key
  def [](key)
    bucket = index(key, size)
    dynamic_array = @array[bucket]
    find_item = dynamic_array.find { |item| 
      item.key == key
    }
    find_item.value if find_item
  end

  # method defines the size of the class array
  def size
    @array.length
  end

  # hashes key by summing the char values taking the modulus of @array.size
  def index(key, size)
    key.sum % size
  end

  # copy values from old array to new array after resizing
  def transcribe(old_array)
    old_array.each do |dynamic_array|
      dynamic_array.each do |item|
        self[item.key] = item.value
      end
    end
  end

  # method resizes hash by doubling bucket count and copy old information into new array
  def resize
    old_array = @array
    @array = Array.new(old_array.length * 2) { [] }
    transcribe(old_array)
  end
end
