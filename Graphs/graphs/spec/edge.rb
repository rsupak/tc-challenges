require_relative 'vertex'

# class that defines connections between 2 vertices
class Edge
  attr_reader :edge, :vertices
  def initialize(v1, v2)
    @edge = v1.name < v2.name ? v1.name + v2.name : v2.name + v1.name
    @vertices = [v1, v2]
  end

  # tests equality of two edges
  def ==(e)
    self.edge == e.edge
  end
end
