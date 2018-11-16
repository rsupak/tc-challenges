# Nodes for Binary Search Trees requires pointers
# to the nodes to the left and right branches.
# This particular node uses the rating value as the
# key for the placing the node in the tree

class Node
  attr_accessor :title
  attr_accessor :rating
  attr_accessor :left
  attr_accessor :right

  def initialize(title, rating)
    @title = title
    @rating = rating
  end
end
