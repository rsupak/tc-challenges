require_relative 'node'
require 'thread'
require 'pry'
require 'byebug'

class MinHeap

  attr_reader :root
  attr_reader :count
  attr_reader :row_number

  def initialize(root)
    @root = root
    @root.id = 1
    @count = 1
  end

  def insert(root, new_node)
    new_node.id = @count + 1
    current = find_parent(root, new_node)

    if current.left.nil?
      current.left = new_node
      new_node.parent = current
      @count += 1
    elsif current.right.nil?
      current.right = new_node
      new_node.parent = current
      @count += 1
    end
    heapify(new_node)
  end

  def delete(node, data)
    return if data.nil?

    target = find(node, data)
    return if target.nil?

    remove(node, target)
  end

  def find(node, data)
    return node if node.rating == data

    ltree = !node.left.nil? ? find(node.left, data) : nil
    return ltree unless ltree.nil?

    !node.right.nil? ? find(node.right, data) : nil
  end

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

  def find_parent(node, target)
    return node if node.id == target.id / 2

    ltree = !node.left.nil? ? find_parent(node.left, target) : nil
    return ltree unless ltree.nil?

    !node.right.nil? ? find_parent(node.right, target) : nil
  end

  def heapify(node)
    until node.rating >= node.parent.rating
      if node.parent.rating >= node.parent.left.rating
        (node.parent.rating, node.parent.left.rating =
        node.parent.left.rating, node.parent.rating)
        (node.parent.title, node.parent.left.title =
        node.parent.left.title, node.parent.title)
        heapify(node.parent) unless node.parent.id == 1
      elsif node.parent.rating >= node.parent.right.rating
        (node.parent.rating, node.parent.right.rating =
        node.parent.right.rating, node.parent.rating)
        (node.parent.title, node.parent.right.title =
        node.parent.right.title, node.parent.title)
        heapify(node.parent) unless node.parent.id == 1
      end
    end
  end

  def remove(node, target)
    last_node = find_last(node, @count)
    parent = find_parent(node, target)

    if target == parent.left
      if target == last_node
        parent.left = nil
      else
        last_node.left = target.left
        last_node.right = target.right
        parent.left = last_node
        heapify(parent.left.left) unless parent.left.left.nil?
        heapify(parent.left.right) unless parent.left.right.nil?
      end
    else
      if target == last_node
        parent.right = nil
      else
        last_node.left = target.left
        last_node.right = target.right
        parent.right = last_node
        heapify(parent.right.left) unless parent.right.left.nil?
        heapify(parent.right.right) unless parent.right.right.nil?
      end
    end
    @count -= 1
  end

  def find_last(node, target)
    return node if node.id == target

    ltree = !node.left.nil? ? find_last(node.left, target) : nil
    return ltree unless ltree.nil?

    !node.right.nil? ? find_last(node.right, target) : nil
  end
end

root = Node.new("The Matrix", 87)
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

heap.insert(root, node9)
heap.insert(root, node10)
heap.insert(root, node3)
heap.insert(root, node8)
heap.insert(root, node1)
heap.insert(root, node5)
heap.insert(root, node2)
heap.insert(root, node7)
heap.insert(root, node6)
heap.insert(root, node11)
# heap.insert(root, node4)

# heap.insert(root, node6)
# heap.insert(root, node2)
# heap.insert(root, node4)
# heap.insert(root, node5)

# heap.insert(root, node9)
# heap.insert(root, node8)
# heap.insert(root, node2)
# heap.insert(root, node5)
# heap.insert(root, node11)

# p heap
# heap.delete(root, node11.rating)
# puts ""
# p heap
# puts heap.find(root, node5.rating).rating
heap.printf
