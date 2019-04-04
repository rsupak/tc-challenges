class Paddle
  attr_accessor :x, :y, :height, :width

  WHITE = Gosu::Color.new(0xFFFFFFFF)

  def initialize(width = 60, x = 300)
    @height = 20
    @width = width
    @x = Tutorial::WIDTH / 2 - @width / 2
    @y = Tutorial::HEIGHT - @width
    @color = WHITE
  end

  def right
    @x += 6 if @x < Tutorial::WIDTH - @width
  end

  def left
    @x -= 6 if @x > 0
  end

  def draw
    Gosu.draw_quad(
      @x, Tutorial::HEIGHT - 30, @color,
      @x + @width, Tutorial::HEIGHT - 30, @color,
      @x + width, Tutorial::HEIGHT - 25, @color,
      @x, Tutorial::HEIGHT - 25, @color
    )
  end

  def hit?(ball)
    ball_left = ball.x
    paddle_left = @x
    ball_right = ball.x + ball.width
    paddle_right = @x + @width
    ball_top = ball.y
    paddle_top = @y
    ball_bottom = ball.y + ball.height
    paddle_bottom = @y + @height

    return false if ball_bottom < paddle_top
    return false if ball_top > paddle_bottom
    return false if ball_right < paddle_left
    return false if ball_left > paddle_right

    true
  end
end
