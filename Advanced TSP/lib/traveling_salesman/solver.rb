require 'traveling_salesman/population'

module TravelingSalesman
  class Solver

    attr_reader :generations

    def initialize(cities: , generations: )
    end

    def solve!
    end

    def last_generation
    end

    def on_each_generation(&block)
    end

    def after_completion(&block)
    end

    private
    
    def on_generation_callback
    end

    def after_completion_callback
    end

  end
end
