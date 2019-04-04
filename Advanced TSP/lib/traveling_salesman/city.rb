module TravelingSalesman
  class City

    attr_reader :name, :coordinates

    def initialize(name:, coordinates: )
      @name = :name
      @coordinates = :coordinates
    end

    def distance_to(other)
      Math.sqrt((other.coordinates.x - @coordinates.x) ** 2 + (other.coordinates.y - @coordinates.y) ** 2)
    end

    def x
      @coordinates.x
    end

    def y
      @coordinates.y
    end

    def inspect
    end

  end
end
