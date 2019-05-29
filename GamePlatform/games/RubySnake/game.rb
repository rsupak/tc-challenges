require 'ruby2d'
require_relative './lib/snake'

# window constants
set title: 'Ruby Snake'
set background: 'lime'
set fps_cap: 10
set width: 640
set height: 640
GRID_SIZE = 20
GRID_WIDTH = Window.width / GRID_SIZE
GRID_HEIGHT = Window.height / GRID_SIZE

# main class
class Game
  attr_accessor :apple
  attr_reader :finished, :score
  def initialize
    @score = 0
    @apple = nil
    @apple_x = rand(GRID_WIDTH)
    @apple_y = rand(GRID_HEIGHT)
    @finished = false
    select_apple
  end

  # randomly chooses apple to draw and assigns points depending on apple size
  def select_apple
    apples = { big_apple: ['img/BigApple.png', 2],
               small_apple: ['img/SmallApple.png', 1] }
    @apple = apples[apples.keys.sample]
  end

  # draws apple and score board onto the window
  def draw
    unless finished
      Image.new(@apple[0],
                x: @apple_x * GRID_SIZE,
                y: @apple_y * GRID_SIZE)
    end
    Text.new(text_message, color: 'navy', x: 10, y: 10, size: 25)
  end

  # checks to see if snake run into the apple
  def snake_hit_apple?(x, y)
    @apple_x == x && @apple_y == y
  end

  # if snake has hit apple, add to score and draw new apple
  def record_hit
    @score += @apple[1]
    select_apple
    @apple_x = rand(GRID_WIDTH)
    @apple_y = rand(GRID_HEIGHT)
  end

  # checks for game over
  def finish
    @finished = true
  end

  private

  # sets scoreboard messages
  def text_message
    if finished
      "Game Over! Final Score: #{@score}! Press R to restart"
    else
      "Score: #{@score}"
    end
  end
end

# game loop
if $PROGRAM_NAME == __FILE__
  snake = Snake.new
  game = Game.new

  update do
    clear

    snake.move unless game.finished
    snake.draw
    game.draw

    if game.snake_hit_apple?(snake.x, snake.y)
      prev_score = game.score
      game.record_hit
      until prev_score == game.score
        snake.grow
        prev_score += 1
      end
    end

    game.finish if snake.collision?
  end

  on :key_down do |event|
    if %w[up down left right].include?(event.key) &&
       snake.can_change_direction_to?(event.key)
      snake.direction = event.key
    elsif event.key == 'r'
      snake = Snake.new
      game = Game.new
    end
  end
  show
end
