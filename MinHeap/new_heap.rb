class Node
  attr_accessor :title, :rating, :left, :right

  def initialize(title, rating)
    @title = title
    @rating = rating
  end

  def to_s
    "Title: #{@title}: Rating: #{@rating}"
  end
end

class MinHeap
  attr_accessor :heap_size, :heap

  def initialize(root)
    @heap = [root]
  end

  def insert(_root, node)
    heap << node
  end

  def root
    heap.first
  end

  def delete(node)
    remove = heap.index(node)
    last = heap.size - 1
    heap[remove], heap[last] = heap[last], heap[remove]
    heap.pop
    reload
    heapify
  end

  def printf
    puts heap_test.heap
  end

  def left_child(index)
    2 * index + 1
  end

  def right_child(index)
    2 * index + 2
  end

  def left_child_key(index)
    heap[left_child(index)]
  end

  def right_child_key(index)
    heap[right_child(index)]
  end

  def leaf_node?(index)
    index >= heap_size / 2
  end

  def satisfied?(index)
    heap[index] <= left_child_key(index) &&
      heap[index] <= right_child_key(index)
  end

  def reload
    heap.map.with_index do |node, i|
      node.left = left_child_key(i)
      node.right = right_child_key(i)
    end
  end

  def heapify
    swapped = true
    until swapped == false
      swapped = false
      heap.each.with_index do |node, i|
        left = heap.index(node.left)
        unless node.left.nil?
          if node.rating > node.left.rating
            heap[i], heap[left] = heap[left], heap[i]
            swapped = true
          end
        end
        reload
      end
    end
  end
end

# Node initializations
node0 = Node.new('The Matrix', 87)
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

# Min Heap object
heap_test = MinHeap.new(node0)
heap_test.insert(node0, node3)
heap_test.insert(node0, node2)
heap_test.insert(node0, node1)
heap_test.reload
# heap_test.heap.each do |node|
#   puts node.to_s
# end
heap_test.heapify
# puts ''
# heap_test.heap.each do |node|
#   puts node.to_s
# end
# puts heap_test.root.to_s
# puts heap_test.root.left.to_s
# puts heap_test.root.right.to_s
# puts heap_test.root.left.left.to_s

