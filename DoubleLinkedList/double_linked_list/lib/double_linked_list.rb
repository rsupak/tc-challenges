class Link
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil, nxt = nil, prev = nil)
    @key, @val, @next, @prev = key, val, nxt, prev
  end

  def to_s
    "#{@key}, #{@val}"
  end
end

class DoubleLinkedList
  attr_reader :head, :tail

  include Enumerable

  def initialize
    @head = Link.new
    @tail = nil
  end

  def [](i)
  end

  def first
    @head
  end

  def last
    @tail
  end

  def empty?
    @head.nil? ? true : false
  end

  def get(key)
  end

  def include?(key)
  end

  def insert(key, val)
  end

  def remove(key)
  end

  def each
  end

  def to_s
  end
end
