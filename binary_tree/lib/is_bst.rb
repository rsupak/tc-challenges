# Node class is the root of each tree/branch and used to create the Binary tree
class Node
  include Enumerable

  attr_accessor :data, :left, :right

  def initialize(data, left = nil, right = nil)
    @data = data
    @left = left
    @right = right
  end

  # overrides #each method in order to get the data from each node
  def each(&block)
    left.each(&block) unless left.nil?
    yield data
    right.each(&block) unless right.nil?
  end

  # test the validity of consecutive blocks yielded by #each
  def valid?
    each_cons(2).all? { |a, b| a <= b }
  end

  # reverses the tree in order to test for validity of a >= b
  # required to test for reversed trees
  def reverse(tree)
    return if tree.nil?

    temp = tree.left
    tree.left = reverse(tree.right)
    tree.right = reverse(temp)
    tree
  end
end

# main method, utilizes the methods built into the Node class to test
# if the each node is a valid binary search tree.
def bst?(tree)
  return true if tree.nil?

  tree.valid? || tree.reverse(tree).valid?
end

# simple test method
if $PROGRAM_NAME == __FILE__
  bst = Node.new(5)
  bst.left = Node.new(3)
  bst.right = Node.new(4)
  p bst?(bst)
end
