require_relative 'node'

# linked list with accessors and insertion method.
# this data structure will be used to hold information in addressed
# locations to later be returned to the array in sorted order
class LinkedList
  attr_accessor :head
  def initialize
    @head = nil
  end

  # inserts node into linked list in sorted order
  def insert(data)
    new_node = Node.new(data)

    if @head.nil? || data < @head.data
      new_node.next = @head
      @head = new_node
    else
      current = @head
      current = current.next while !current.next.nil? && current.next.data < data
      new_node.next = current.next
      current.next = new_node
    end
  end

  # print nodes in linked list
  def print_list
    current = @head
    until current.nil?
      print current.data.to_s + " => "
      current = current.next
    end
  end
end
