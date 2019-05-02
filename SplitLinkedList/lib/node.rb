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

# main method
# takes a source node and empty nodes for front & back values
# (in order to test for edge cases, i.e. empty sources, fronts or backs)
def front_back_split(source, front, back)
  # test for edge cases where values are nil
  begin
    if source.nil? && front.nil? && back.nil?
      raise ArgumentError, 'throw an error if source, front, and back lists are null'
    elsif source.nil?
      raise ArgumentError, 'error should be thrown if source is null'
    elsif front.nil?
      raise ArgumentError, 'error should be thrown if front is null'
    elsif back.nil?
      raise ArgumentError, 'error should be thrown if back is null'
    end

    # test for edge cases where list size < 2
    if source.value.nil?
      raise ArgumentError, 'error should be thrown if source has an empty node'
    elsif size(source) == 1
      raise ArgumentError, 'error should be thrown if source has only one node'
    end
  end

  back_ptr = get_back_pointer(source)
  front_list = front(source, back_ptr)
  back_list = back(back_ptr)
  ["front should be #{front_list}", "back should be #{back_list}"]
end

# identifies pointer for beginning of back list
def get_back_pointer(source)
  current = source
  count = 0
  size = size(source)
  mid = size.odd? ? size / 2 : size / 2 - 1
  until count == mid
    current = current.next
    count += 1
  end

  current.next
end

# counts list size
def size(source)
  current = source
  size = 0
  until current.nil?
    size += 1
    current = current.next
  end
  size
end

# creates array of of values from the front of the list then uses 
# build_list_from_array to return a linked list to main method
def front(front_ptr, back_ptr)
  current = front_ptr
  front_list = []
  until current == back_ptr
    front_list << current.value
    current = current.next
  end

  build_list_from_array(front_list)
end

# creates array of of values from the back half of the list (starting at
# back_ptr) then uses build_list_from_array to return a linked list to
# main method
def back(back_ptr)
  current = back_ptr
  back_list = []
  until current.nil?
    back_list << current.value
    current = current.next
  end

  build_list_from_array(back_list)
end

# creates linked list from an array of numbers
# used in both main methods and RSpec testing methods
def build_list_from_array(arr)
  head = nil
  current = head
  arr.each do |value|
    if head.nil?
      head = Node.new(value)
      current = head
    else
      current.next = Node.new(value)
      current = current.next
    end
  end
  head
end

# test method
if $PROGRAM_NAME == __FILE__
  list = build_list_from_array([1, 2, 3, 4, 5])
  p front_back_split(list, Node.new, Node.new)
end
