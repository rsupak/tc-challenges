require_relative 'node'

# Open Addressing is a fast hashing technique
# that makes use of starting array resizing
# rather than chaining new inputs in each bucket.
# One of the major issues to look out for is data clustering.
class OpenAddressing
  attr_accessor :table

  # initialize hash to an array of size passed in
  # uncomment load_factor if you want to set up a dynamic table
  def initialize(size)
    @table = Array.new(size)
    # @load_factor = 0.6
    @entry_count = 0
  end

  # setter
  def []=(key, value)
    hash_item = Node.new(key, value)
    bucket = index(key, size)
    resize if full?
    bucket = next_open_index(bucket) while @table[bucket]
    @table[bucket] = hash_item
    @entry_count += 1
    # uncomment line below to help prevent overloading the table
    # resize if @entry_count >= @load_factor * size
  end

  # getter
  def [](key)
    items.each do |k, v|
      return v if k == key
    end
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string
  # as a starting point.
  def index(key, size)
    key.sum % size
  end

  def full?
    @entry_count == size
  end

  # Given an index, find the next open index in hash
  # Returns -1 if hash is full
  # If using a dynamic table, hash will never be full
  def next_open_index(index)
    return -1 if full?

    # searches for next available index using linear probing
    while @table[index]
      if index < size - 1
        index += 1
      else
        index = 0
      end
    end
    index
  end

  # Simple method to return the number of items in the hash
  def size
    @table.size
  end

  # Resize the hash
  def resize
    size = self.size * 2
    old_items = items
    @table = Array.new(size)
    @entry_count = 0
    transcribe(old_items)
  end

  # copies values from old hash to new hash after resize
  def transcribe(items)
    items.each do |key, value|
      self[key] = value
    end
  end

  # creates a key array for interating over keys
  def keys
    key_array = []
    @table.map { |item| key_array << item.key}
    key_array
  end

  # creates a values array for iterating over values
  def values
    value_array = []
    @table.map { |item| value_array << item.value }
    value_array
  end

  # creates a key/value array for iterating over key/value pairs
  def items
    item_array = []
    @table.map { |item| item_array << [item.key, item.value] if item }
    item_array
  end
end

star_wars_movies = OpenAddressing.new(6)

# Index Test
i = star_wars_movies.index('Star Wars: A New Hope', 6)
puts i

# Key Test
# This is essentially another test of the index method
key = 'test'
star_wars_movies.index(key, 6)

# Collision Test (table not full)
# Does not resize when table is not full
hash = OpenAddressing.new(4)
hash['key'] = 'value'
puts hash.size
hash['key'] = 'second value'
puts hash.size
# see the collision resolution in action!
p hash

# Collision Test 2 (table full)
# Resizes table when full
hash = OpenAddressing.new(1)
hash['key'] = 'value'
p hash
puts hash.size
hash['key'] = 'second value'
puts hash.size
p hash

# Set Values
star_wars_movies['Star Wars: The Phantom Menace'] = 'Number One'
star_wars_movies['Star Wars: Attack of the Clones'] = 'Number Two'
star_wars_movies['Star Wars: Revenge of the Sith'] = 'Number Three'
star_wars_movies['Star Wars: A New Hope'] = 'Number Four'
star_wars_movies['Star Wars: The Empire Strikes Back'] = 'Number Five'
star_wars_movies['Star Wars: Return of the Jedi'] = 'Number Six'

# Returns Values when key is given
puts star_wars_movies['Star Wars: The Phantom Menace']
puts star_wars_movies['Star Wars: Attack of the Clones']
puts star_wars_movies['Star Wars: Revenge of the Sith']
puts star_wars_movies['Star Wars: A New Hope']
puts star_wars_movies['Star Wars: The Empire Strikes Back']
puts star_wars_movies['Star Wars: Return of the Jedi']

# Open Bucket Test
# If hash is full, returns -1
inception = OpenAddressing.new(1)
inception['The Original'] = 'The Best Movie Ever'
puts inception.next_open_index(0)

# Resize Test 1
# Resize when called
movies = OpenAddressing.new(6)
puts movies.size
movies.resize
puts movies.size

# Resize Test 2
# Copies values on resize
movies = OpenAddressing.new(6)
puts movies.size
movies['A New Hope'] = 'Average'
movies['Empire Strikes Back'] = 'Excellent'
movies['Return of the Jedi'] = 'The Best'
puts movies.size
movies.resize
puts movies['A New Hope']
puts movies['Empire Strikes Back']
puts movies['Return of the Jedi']
puts movies.size
p movies
