require_relative 'node'

class BinarySearchTree
  attr_accessor :root

  def initialize(root)
    @root = root
  end

  # recursive insert method
  # checks adds node to tree by comparing
  # node.rating values.
  # If rating value is less than values in the tree,
  # it is passed down and added into the appropriate left branch.
  # If rating value is greater than values in the tree,
  # it is passed down and added into the appropriate right branch.
  def insert(root, node)
    if node.rating < root.rating
      root.left.nil? ? root.left = node : insert(root.left, node)
    elsif node.rating >= root.rating
      root.right.nil? ? root.right = node : insert(root.right, node)
    end
  end

  # The find method recursively traverses the left and right branches
  # until it reaches the terminal leaf or finds and returns the node.
  # This method is looking for the value held @ node.title, and must 
  # traverse each branch in the tree until it finds the requested value.
  # This creates a O(n) search method. 
  # It would be more efficient to search for the key (ratings) values
  # and then identify the title values at that rating.
  def find(node, data)
    return node if node.title == data

    ltree = !node.left.nil? ? find(node.left, data) : nil
    return ltree unless ltree.nil?

    !node.right.nil? ? find(node.right, data) : nil
  end

  # The delete method makes use of the find method above
  # To locate the node in the tree. Once the node is found
  # it uses the private remove method to delete the node.
  # See private methods!
  def delete(node, data)
    return if data.nil?

    target = find(node, data)
    return if target.nil?

    remove(node, target)
  end

  # This method creates takes advantage of Ruby's built in
  # Queue class. By pushing the data of the root node to the queue,
  # it allows the method to traverse the tree and output the
  # values of each node to stdout using the puts method
  # dequeue'ing each item until the queue is exhausted.
  def printf(node)
    queue = Queue.new
    queue.enq(node)
    until queue.empty?
      value = queue.deq
      puts "#{value.title}: #{value.rating}" unless value.title.nil?
      queue.enq(value.left) if value.left
      queue.enq(value.right) if value.right
    end
  end

  # The following private methods are helper methods used primarily for
  # deleting a node from the tree. They prevent overtasking the delete
  # method by making these methods modular.
  private

  # The remove method locates the parent node of the node to be delete.
  # It then establishes which branch the node is attached to on the parent node.
  # If the node is attached to the right branch of the parent, the method
  # changes the right branch pointer of the parent to the right branch pointer of the 
  # node to be removed. 
  def remove(node, target)
    parent = find_parent(node, target)
    parent.left = target.left if target == parent.left
    parent.right = target.right if target == parent.right
  end

  # This method is similar to the find method, it traverses
  # each branch in the tree until it identifies the target node
  # as a branch of the find_parent. it then returns the parent node
  # so that the remove method can shift the pointer from the target
  # node to the next node in the branch.
  def find_parent(node, target)
    return node if [node.left, node.right].include?(target)

    ltree = !node.left.nil? ? find_parent(node.left, target) : nil
    return ltree unless ltree.nil?

    !node.right.nil? ? find_parent(node.right, target) : nil
  end
end

root = Node.new('The Matrix', 87)
tree = BinarySearchTree.new(root)

pacific_rim = Node.new('Pacific Rim', 72)
braveheart = Node.new('Braveheart', 78)
jedi = Node.new('Star Wars: Return of the Jedi', 80)
donnie = Node.new('Donnie Darko', 85)
inception = Node.new('Inception', 86)
district = Node.new('District 9', 90)
shawshank = Node.new('The Shawshank Redemption', 91)
martian = Node.new('The Martian', 92)
hope = Node.new('Star Wars: A New Hope', 93)
empire = Node.new('Star Wars: The Empire Strikes Back', 94)
mad_max_2 = Node.new('Mad Max 2: The Road Warrior', 98)
xxx = Node.new('XXX', 97)

# p tree

tree.insert(root, mad_max_2)
tree.insert(root, district)
tree.insert(root, shawshank)
tree.insert(root, braveheart)
tree.insert(root, inception)
tree.insert(root, pacific_rim)
tree.insert(root, martian)
tree.insert(root, xxx)
tree.insert(root, jedi)
tree.insert(root, empire)
tree.insert(root, hope)
tree.insert(root, donnie)


# puts tree.find(root, hope.title).title

tree.printf(root)
