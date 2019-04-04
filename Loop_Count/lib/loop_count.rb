class Node
  attr_accessor :value, :next
  def initialize(value = nil)
    @value = value
    @next = nil
  end
end

class LinkedList
  attr_accessor :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  # This method creates a new `Node` using `data`, and inserts it at the end of the list.
  def <<(node)
    @tail.next = node unless @tail.nil?
    @tail = node
    @head = node if @head.nil?
  end

  def create_chain_to_test(tail_size, loop_size)
    self << Node.new(true) until size == tail_size
    loopy = LinkedList.new
    loopy << Node.new(true) until loopy.size == loop_size
    loopy.tail.next = loopy.head unless loopy.tail.nil?
    @tail.next = loopy.head unless @tail.nil?
    @head = loopy.head if @head.nil? && @tail.nil?
  end

  def loop_size
    count = 0
    slow_p = @head
    fast_p = @head
    while slow_p && fast_p && fast_p.next
      slow_p = slow_p.next
      fast_p = fast_p.next.next
      return count_nodes(slow_p) if slow_p == fast_p
    end
    count
  end

  def count_nodes(node)
    current_node = node
    count = 0
    until current_node.next == node
      count += 1
      current_node = current_node.next
    end
    count
  end

  def size
    count = 0
    current_node = @head
    loop_head = @head
    until current_node == @tail
      count += 1
      current_node = current_node.next
      return 0 if current_node == loop_head
    end
    count
  end
end


# test code
if $PROGRAM_NAME == __FILE__
  list = LinkedList.new
  list.create_chain_to_test(3, 11)
  puts "Tail Size: #{list.size}"
  puts "Loop Size: #{list.loop_size}"
end
