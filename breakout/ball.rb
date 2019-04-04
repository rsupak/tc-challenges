class Ball
  attr_accessor :x, :y, :radius, :velocity_x, :velocity_y

  def initialize
    @x = Window.width / 3
    @y = Window.height / 3
    @radius = 6
    @velocity_x = 5
    @velocity_y = 5
  end

  def draw
    Circle.new(
      color: 'white',
      x: @x,
      y: @y,
      radius: @radius
    )
  end

  def update
    @x += @velocity_x
    @y += @velocity_y
  end

  def bounce
    @velocity_y *= -1 unless @x + radius > Window.width || @x - @radius < 0
    @velocity_x *= @x + @radius < Window.width && @x - @radius + 1 > 0 ? 1 : -1
  end

  def falls?
    @y > Window.height
  end
    
end
