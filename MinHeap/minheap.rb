class Node
  attr_accessor :title, :rating, :left, :right, :parent

  def initialize(title, rating)
    @title = title
    @rating = rating
    @left = nil
    @right = nil
    @parent = nil
  end

  def to_string
    "Title: #{@title}: Rating: #{@rating}"
  end
end

class MinHeap
  attr_accessor :root, :heap_array

  def initialize(root)
    @root = root
    @heap_array = [root]
  end

  def insert(node)
    @heap_array << node
    @heap_array.each.with_index do |item, i|
      item.left = @heap_array[(2 * i) + 1]
      item.right = @heap_array[(2 * i) + 2]
      item.parent = @heap_array[(i / 2)]
    end
  end

  def find(_root, data)

  end

  def printf
    queue = Queue.new
    queue.enq(@root)
    until queue.empty?
      value = queue.deq
      puts value.to_string unless value.title.nil?
      queue.enq(value.left) if value.left
      queue.enq(value.right) if value.right
    end
  end

  def delete(_root, data)

  end
end

node0 = Node.new('The Matrix', 87)
heap = MinHeap.new(node0)
node1 = Node.new('Pacific Rim', 72)
node2 = Node.new('Braveheart', 78)
node3 = Node.new('Star Wars: Return of the Jedi', 80)
node4 = Node.new('Donnie Darko', 85)
node5 = Node.new('Inception', 86)
node6 = Node.new('District 9', 90)
node7 = Node.new('The Shawshank Redemption', 91)
node8 = Node.new('The Martian', 92)
node9 = Node.new('Star Wars: A New Hope', 93)
node10 = Node.new('Star Wars: The Empire Strikes Back', 94)
node11 = Node.new('Mad Max 2: The Road Warrior', 98)
# heap.insert(node1)
# heap.insert(node2)
# heap.insert(node3)
# heap.insert(node4)
# heap.insert(node5)
heap.insert(node6)
heap.insert(node7)
heap.insert(node8)
heap.insert(node9)
# heap.delete(node0, node9.rating)
# heap.heap_array.pop
# puts heap.find(node0, node9.rating).rating
# heap.printf
# heap.heap_array.each { |item| puts item.to_string }
# heap.heap_array.pop
# heap.heap_array.each { |item| puts item.to_string }
