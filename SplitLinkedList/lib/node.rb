# base class of linked list
class Node
  attr_accessor :value, :next

  def initialize(value = nil)
    @value = value
    @next = nil
  end

  # creates an output string to be used with #puts
  def to_s
    output = ''
    current_node = self
    until current_node.nil?
      output << "#{current_node.value} -> "
      current_node = current_node.next
    end
    output + 'null'
  end
end
