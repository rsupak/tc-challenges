# class that holds each edge that has been defined
class EdgeSet
  attr_reader :edges
  def initialize
    @edges = []
  end

  # only adds connections which do not already exist.
  # one connection between any 2 nodes
  def add(e)
    return if edge?(e)

    edges << e
    e.vertices.map { |v| v.degree += 1 }
  end

  # returns number of connections in edgeset
  def count
    edges.size
  end

  # returns true if edge in edgeset
  def edge?(e)
    edges.include?(e)
  end
end
