class Block
  HEIGHT = 12
  WIDTH = 78
  attr_reader :x, :y, :width, :height, :color

  def initialize(color = 'white', x, y)
    @x = x
    @y = y
    @width = WIDTH
    @height = HEIGHT
    @color = color
  end

  def draw
    Rectangle.new(color: @color, x: @x, y: @y, width: WIDTH, height: HEIGHT)
  end
end
