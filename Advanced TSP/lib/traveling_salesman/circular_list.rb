module TravelingSalesman
  class CircularList

    include Enumerable

    def initialize(array)
    end

    def slice(*args)
    end

    alias_method :[], :slice

    def []=(*args)
    end

    def size
    end

    def each(&block)
    end

    def each_cons(n)
    end

    def ==(other)
    end

    def eql?(other)
    end

    def hash
      # pretty high collision rate for this hash function...
    end

    def inspect
    end

    private

    def normalize_index(index)
    end

  end
end
