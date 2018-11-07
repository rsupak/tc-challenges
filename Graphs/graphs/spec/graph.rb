require_relative 'vertex'
require_relative 'edge'
require_relative 'edge_set'
require 'matrix'

# Graph implementation in Ruby
class Graph
  attr_reader :vertices, :edges
  def initialize(vertices, edges)
    @vertices = vertices
    @edges = edges
  end

  # tests whether vertex exists in graph
  def vertex?(v)
    vertices.include?(v)
  end

  # tests whether edge exists in graph
  def edge?(e)
    edges.edge?(e)
  end

  # tests whether vertices form an edge in the graph
  def adjacent?(v1, v2)
    edge?(Edge.new(v1, v2))
  end

  # The following methods look at the connections made within
  # the graph. They determine the minimum / maximum number of 
  # connections owned by any vertex as well as the total
  # connections found in the graph.

  # returns total connections
  def degree
    get_degree_array.reduce(:+)
  end

  # returns minimum number of connections
  def min_degree
    get_degree_array.min
  end

  # returns maximum number of connections
  def max_degree
    get_degree_array.max
  end

  # helper method to calculate degrees in graph
  def get_degree_array
    arr = []
    vertices.each { |v| arr << v.degree }
    arr
  end
end
