# a simple node class used for key/value storage and lookup
class Node
  attr_accessor :key
  attr_accessor :value

  def initialize(key, value)
    @key = key
    @value = value
  end
end
