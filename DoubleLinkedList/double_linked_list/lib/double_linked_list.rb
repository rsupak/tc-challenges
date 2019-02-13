# Node class for Double Linked List
class Link
  attr_accessor :key, :val, :nxt, :prev

  def initialize(key = nil, val = nil, nxt = nil, prev = nil)
    @key, @val, @nxt, @prev = key, val, nxt, prev
  end

  def to_s
    "#{@key}, #{@val}"
  end
end

# Main Class
class DoubleLinkedList
  attr_accessor :head, :tail, :length

  include Enumerable

  def initialize
    @head = Link.new(0)
    @tail = @head
    @length = 0
  end

  # sets item value at the index(key)
  def []=(key, value)
    current = @head
    until current.key == key
      @tail = @tail.nil? ? current.nxt : current
      current.nxt = current.nxt.nil? ? Link.new(current.key + 1, nil, nil, current) : current.nxt
      current = current.nxt
    end
    @tail = current if current.nxt.nil?
    current.val = value
    @length += 1
  end

  # returns the value from the list at the given index
  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  # returns the value of the first item in the list
  def first
    @head.val
  end

  # returns the value of the last item in the list
  def last
    @tail.val
  end

  # iterates over each item in the list
  def each
    current = @head
    until current.nil?
      yield current.val
      current = current.nxt
    end
  end
end

# test block
if $PROGRAM_NAME == __FILE__
  list = DoubleLinkedList.new
  list[0] = 1
  list[1] = 2
  list[2] = 3
  list.each { |link| puts link }
end
