# node class that holds name data and number
# of connections to other vertices
class Vertex
  attr_accessor :degree, :name

  def initialize(name)
    @name = name
    @degree = 0
  end

  def to_s
    name
  end

  # tests equality of 2 vertices
  def ==(v)
    self.name == v.name
  end
end
