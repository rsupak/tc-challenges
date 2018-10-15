require_relative 'node'
require 'pry'
require 'byebug'

# Min-Heap is a binary-tree data structure in which the root nodes
# for each branch are the smallest comparable of the branch. They
# are a common way for implementing priority queues.
class MinHeap
  attr_reader :root
  attr_reader :count
  attr_reader :row_number

  def initialize(root)
    @root = root
    @root.id = 1
    @count = 1
  end

  # adds new_node to binary-tree
  # insertion is incremented by level in order to build a balanced tree
  # the method does this by assigning each node an id, then locates the
  # potential parent node. parent node must be filled before next parent
  # node is accessed. Level must be filled before next level is access.
  # finally heapify is performed on the new node in order to prioritize
  # the node in the queue.
  def insert(root, new_node)
    new_node.id = @count + 1
    current = find_parent(root, new_node)

    current.left.nil? ? current.left = new_node : current.right = new_node
    new_node.parent = current

    heapify(new_node)
    @count += 1
  end

  # deletes node
  # see private method remove()
  def delete(node, data)
    return if data.nil?

    target = find(node, data)
    return if target.nil?

    remove(node, target)
  end

  # The find method recursively searches the left and right branches
  # until it reaches the terminal leaf or finds and returns the node.
  # O(n) time complexity. Because the nodes can be in any branch as long
  # as it follows the rule that states the root of each branch must be
  # <= each subsequent branch. The entire structure, potentially, must be
  # searched until the node is located.
  def find(node, data)
    return node if node.rating == data

    ltree = !node.left.nil? ? find(node.left, data) : nil
    return ltree unless ltree.nil?

    !node.right.nil? ? find(node.right, data) : nil
  end

  # This method creates takes advantage of Ruby's built in
  # Queue class. By pushing the data of the root node to the queue,
  # it allows the method to traverse the tree and output the
  # values of each node to stdout using the puts method
  # dequeue'ing each item until the queue is exhausted.
  def printf
    queue = Queue.new
    queue.enq(@root)
    until queue.empty?
      value = queue.deq
      puts "#{value.title}: #{value.rating}" unless value.title.nil?
      queue.enq(value.left) if value.left
      queue.enq(value.right) if value.right
    end
  end

  private

  # similar to the find method, however method is looking for
  # a specific id rather than a node rating.
  # parent.id will always be equal to target.id / 2
  def find_parent(node, target)
    return node if node.id == target.id / 2

    ltree = !node.left.nil? ? find_parent(node.left, target) : nil
    return ltree unless ltree.nil?

    !node.right.nil? ? find_parent(node.right, target) : nil
  end

  # parity check for monitoring min-heap root rules.
  # if swap is required, continues swapping nodes with parents
  # until smallest nodes are in branch-root locations.
  def heapify(node)
    parent = node.parent
    left_child = node.parent.left
    right_child = node.parent.right
    until node.rating > node.parent.rating
      if parent.rating > left_child.rating
        swap_node(parent, left_child)
      elsif parent.rating > right_child.rating
        swap_node(parent, right_child)
      end
      heapify(parent) unless node.parent.id == 1
    end
  end

  def swap_node(parent, child)
    parent.rating, child.rating = child.rating, parent.rating
    parent.title, child.title = child.title, parent.title
  end

  # Deletion from a heap is more complex than deletion from a
  # search tree. When a node is removed, heap priority rules must
  # be checked and heapified in order to maintain priority order.
  # This is accomplished by moving the last node from the tree into the
  # place of the removed node, then last node is heapified to sort out
  # proper priority order. Finally, the count must be decrimented to ensure
  # insertion order of a new node.
  def remove(node, target)
    last_node = find_last(node, @count)
    parent = find_parent(node, target)

    if target == parent.left
      remove_left(target, parent, last_node)
    elsif target == parent.right
      remove_right(target, parent, last_node)
    end
    @count -= 1
  end

  def find_last(node, target)
    return node if node.id == target

    ltree = !node.left.nil? ? find_last(node.left, target) : nil
    return ltree unless ltree.nil?

    !node.right.nil? ? find_last(node.right, target) : nil
  end

  def remove_left(target, parent, last_node)
    if target == last_node
      parent.left = nil
    else
      remove_swap(last_node, target)
      parent.left = last_node
      heapify_swap(parent.left)
    end
  end

  def remove_right(target, parent, last_node)
    if target == last_node
      parent.right = nil
    else
      remove_swap(last_node, target)
      parent.right = last_node
      heapify_swap(parent.right)
    end
  end

  def remove_swap(target, node)
    node.left = target.left
    node.right = target.right
  end

  def heapify_swap(node)
    heapify(node.left) unless node.left.nil?
    heapify(node.right) unless node.right.nil?
  end
end

root = Node.new('The Matrix', 87)
heap = MinHeap.new(root)

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

# # Insert Test: left-right child
# heap.insert(root, node4)
# heap.insert(root, node5)
# heap.insert(root, node6)
# heap.insert(root, node2)
# heap.printf

# Insert Test: right-left child
# heap.insert(root, node9)
# heap.insert(root, node8)
# heap.insert(root, node2)
# heap.insert(root, node5)
# heap.insert(root, node11)
# heap.printf

# # Find Test: left-right
# heap.insert(root, node2)
# heap.insert(root, node4)
# heap.insert(root, node5)
# heap.insert(root, node6)
# puts "Title: #{heap.find(root, node6.rating).title} | Rating: #{heap.find(root, node6.rating).rating}"

# # Find Test: right-left
# heap.insert(root, node2)
# heap.insert(root, node5)
# heap.insert(root, node11)
# heap.insert(root, node9)
# heap.insert(root, node8)
# puts "Title: #{heap.find(root, node8.rating).title} | Rating: #{heap.find(root, node8.rating).rating}"

# Delete Test: left-right
# heap.insert(root, node6)
# heap.insert(root, node2)
# heap.insert(root, node4)
# heap.insert(root, node5)
# heap.delete(root, node5.rating)
# p heap.find(root, node5.rating)
# puts '**Printing Current Tree**'
# heap.printf

# # Delete Test: right-left
# heap.insert(root, node9)
# heap.insert(root, node8)
# heap.insert(root, node2)
# heap.insert(root, node5)
# heap.insert(root, node11)
# heap.delete(root, node11.rating)
# p heap.find(root, node11.rating)
# puts '**Printing Current Tree**'
# heap.printf

# heap.insert(root, node9)
# heap.insert(root, node10)
# heap.insert(root, node3)
# heap.insert(root, node8)
# heap.insert(root, node1)
# heap.insert(root, node5)
# heap.insert(root, node2)
# heap.insert(root, node7)
# heap.insert(root, node6)
# heap.insert(root, node11)
# heap.printf
