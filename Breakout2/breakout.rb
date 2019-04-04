require 'gosu'
require_relative 'paddle'
WHITE = Gosu::Color.argb(0xFF_FFFFFF)

class Tutorial < Gosu::Window
  WIDTH = 640
  HEIGHT = 480
  def initialize
    super WIDTH, HEIGHT
    self.caption = "Tutorial"
    @paddle = Paddle.new
  end

  def update
  end

  def draw
    @paddle.draw
  end
end

window = Tutorial.new
window.show
