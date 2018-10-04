require_relative 'node'

class LinkedList
  attr_accessor :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  # Method to determine length of list
  def size
    count = 0
    current_node = @head
    until current_node == nil
      count += 1
      current_node = current_node.next
    end
    count
  end

  # This method creates a new `Node` using `data`, and inserts it at the end of the list.
  def add_to_tail(node)
    @tail.next = node if @tail != nil
    @tail = node
    @head = node if @head == nil
  end

  # This method removes the last node in the lists and must keep the rest of the list intact.
  def remove_tail
    current_node = @head
    if self.size == 1
      @head = nil
      @tail = nil
    else
      (self.size - 2).times do
        current_node = current_node.next
      end
      current_node.next = nil
      @tail = current_node
    end 
  end

  # This method prints out a representation of the list.
  def print
    output = ""
    current_node = @head
    until current_node == nil
      output << "#{current_node.value.to_s}\n"
      current_node = current_node.next
    end
    puts output
  end

  # This method removes `node` from the list and must keep the rest of the list intact.
  def delete(node)
    current_node = @head
    previous_node = nil
    until current_node == node
      return nil if current_node == nil
      previous_node = current_node
      current_node = current_node.next
    end
    if current_node == @head
      self.remove_front
    elsif current_node == @tail
      self.remove_tail
    else
      previous_node.next = current_node.next
    end
  end

  # This method adds `node` to the front of the list and must set the list's head to `node`.
  def add_to_front(node)
    node.next = @head
    @head = node
  end

  # This method removes and returns the first node in the Linked List and sets the head to the second node.
  def remove_front
    @head = @head.next
  end

  # This method returns the node at the given index
  def find(index)
    current_node = @head
    i = 0
    until i == index
      current_node = current_node.next
      i += 1
    end
    current_node
  end

  # This methode removes the node at the given index
  def remove_at(index)
    self.delete(self.find(index))
  end
end

list = LinkedList.new
n1 = Node.new("Rob")
n2 = Node.new("Ben")
n3 = Node.new("Mike")
n4 = Node.new("Ken")

list.add_to_tail(n1)
list.add_to_tail(n2)
list.add_to_tail(n3)
list.print
puts ""
list.remove_at(0)
list.print
