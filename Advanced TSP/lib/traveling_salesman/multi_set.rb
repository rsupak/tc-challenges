module TravelingSalesman
  class MultiSet

    extend Forwardable

    def initialize(list)
    end

    def ==(other)
    end

    def_delegators :to_a, :size, :to_s, :sample, :each, :sort_by

    def to_a
    end

    protected

    def grouped
    end

  end
end
