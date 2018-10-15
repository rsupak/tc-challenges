class Node
  attr_accessor :value, :left, :right

  def initialize(value)
    @value = value
    @left = nil
    @right = nil
  end
end

class MinHeap
  attr_accessor :root, :heap_array

  def initialize(root = Node.new(0))
    @root = root
    @heap_array = [root]
  end

  def insert(node)
    @heap_array << node
    @heap_array.each.with_index do |item, i|
      item.left = @heap_array[(2 * i) + 1]
      item.right = @heap_array[(2 * i) + 2]
    end
  end
end

heap = MinHeap.new
node1 = Node.new(1)
node2 = Node.new(2)
node3 = Node.new(3)
node4 = Node.new(4)
node5 = Node.new(5)
node6 = Node.new(6)
node7 = Node.new(7)
node8 = Node.new(8)
heap.insert(node1)
heap.insert(node2)
heap.insert(node3)
# heap.insert(node4)
# heap.insert(node5)
# heap.insert(node6)
# heap.insert(node7)
# heap.insert(node8)
# heap.heap_array.each do |node| 
#   p node.value
#   puts "Left: #{node.left}, Right: #{node.right}"
# end
p heap.heap_array
p heap.heap_array[0].left.right.value

# #<Node:0x00007f8af49194d0 @value=0, 
#   @left=#<Node:0x00007f8af4919480 @value=1, 
#     @left=#<Node:0x00007f8af4919430 @value=3, 
#       @left=nil, 
#       @right=nil>, 
#     @right=nil>, 
#   @right=#<Node:0x00007f8af4919458 @value=2, 
#     @left=nil, 
#     @right=nil>>, 
# #<Node:0x00007f8af4919480 @value=1, 
#   @left=#<Node:0x00007f8af4919430 @value=3, 
#     @left=nil, 
#     @right=nil>, 
#   @right=nil>, 
# #<Node:0x00007f8af4919458 @value=2, 
#   @left=nil, 
#   @right=nil>, 
# #<Node:0x00007f8af4919430 @value=3, @left=nil, @right=nil>
