class Node
  attr_accessor :title
  attr_accessor :rating
  attr_accessor :left
  attr_accessor :right
  attr_accessor :parent
  attr_accessor :id

  def initialize(title, rating)
    @title = title
    @rating = rating
    @id = nil
  end
end
