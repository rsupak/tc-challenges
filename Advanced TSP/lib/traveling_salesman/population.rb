require 'traveling_salesman/solution'
require 'traveling_salesman/tournament'
require 'traveling_salesman/multi_set'
require 'traveling_salesman/mating_pair'

module TravelingSalesman
  class Population

    SIZE = 10

    attr_reader :solutions

    def initialize(solutions)
    end

    def self.initial(cities)
    end

    def successor
    end

    def fittest
    end

    def dup
    end

    def pick_parents
    end

    def displace_weakest_with(others)
    end

    def ==(other)
    end

    private

    def pick_tournament_competitors
    end

  end
end
