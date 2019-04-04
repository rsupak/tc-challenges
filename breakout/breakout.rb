require 'ruby2d'
require_relative './block'
require_relative './paddle'
require_relative './ball'
set fps: 30

class Game
  attr_accessor :ball, :paddle, :blocks, :score
  def initialize
    @score = 0
    @ball = Ball.new
    @paddle = Paddle.new
    @blocks = []
    8.times do |row|
      8.times do |col|
        color = 'red' if row <= 1
        color = 'orange' if row <= 3 && row > 1
        color = 'green' if row <= 5 && row > 3
        color = 'yellow' if row <= 7 && row > 5
        @blocks << Block.new(color, col * 80 + 2, row * 14 + 2)
      end
    end
  end

  def draw
    @blocks.each(&:draw)
    @ball.draw
    @paddle.draw
  end

  def start
    draw
  end

  def update
    @ball.update
    @paddle.draw
  end

  def bounces?
    @ball.bounce if @ball.x + @ball.radius >= Window.width
    @ball.bounce if @ball.x - @ball.radius <= 0
    @ball.bounce if @ball.y - @ball.radius < 0
    if (@ball.y + @ball.radius).between?(@paddle.y, @paddle.y + @paddle.height) &&
       @ball.x.between?(@paddle.x - 1, @paddle.x + @paddle.width + 1)
      @ball.bounce
    end
  end

  def break_block
    @blocks.each do |block|
      if (@ball.y - @ball.radius).between?(block.y, block.y + block.height) &&
         @ball.x.between?(block.x, block.x + block.width)
        @blocks.delete(block)
        @ball.bounce
        score_hit(block)
      end
    end
  end

  def score_hit(block)
    @score += 1 if block.color == 'yellow'
    @score += 2 if block.color == 'green'
    @score += 4 if block.color == 'orange'
    @score += 8 if block.color == 'red'
  end

  def game_over?
    @ball.falls?
  end
end

game = Game.new
Text.new(
  'Breakout',
  size: 30,
  x: Window.width / 3 + 20,
  y: Window.height / 2 - 30
)

update do
  clear
  game.draw
  game.update unless game.game_over?
  game.bounces?
  game.break_block
end

on :key_held do |event|
  game.paddle.move(event.key) unless game.game_over?
end

on :key_down do |event|
  close if event.key == 'q'
  game = Game.new if event.key == 'r'
end
show
