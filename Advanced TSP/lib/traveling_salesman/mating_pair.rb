require 'traveling_salesman/solution'
require 'traveling_salesman/partially_mapped_crossover'

module TravelingSalesman
  class MatingPair

    attr_reader :parent1, :parent2, :brood_size

    def initialize(parent1, parent2, brood_size: )
    end

    def children
    end

    def make_child_pair
    end
  end
end
