# basic node class to hold data passed in and key to the next node
# in the linked list
class Node
  attr_accessor :data, :next
  def initialize(data)
    @data = data
    @next = nil
  end
end
