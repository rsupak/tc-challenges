require 'ruby2d'

class Paddle
  attr_accessor :x, :y, :height, :width, :direction
  def initialize(width = 60, x = (Window.width / 2) - (width / 2))
    @width = width
    @height = 10
    @x = x
    @y = Window.height - 40
    @direction = nil
  end

  def move(direction)
    case direction
    when 'left'
      @x -= 6 unless @x <= 0
    when 'right'
      @x += 6 unless @x + width - 4 > Window.width
    end
  end

  def draw
    Rectangle.new(
      color: 'white',
      x: @x,
      y: @y,
      width: @width,
      height: @height
    )
  end
end
