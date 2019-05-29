# Player class: Draws snake and controls snake growth and movement.
class Snake
  attr_writer :direction
  def initialize
    @positions = [[5, 3], [5, 4]]
    @direction = 'down'
  end

  # draws snake head and circle for the tail
  def draw
    # snake head
    Image.new('img/SnakeHead.png',
              x: head[0] * GRID_SIZE,
              y: head[1] * GRID_SIZE)
    # snake tail
    @positions[0..-2].each do |position|
      Circle.new(x: position[0] * GRID_SIZE + GRID_SIZE / 2,
                 y: position[1] * GRID_SIZE + GRID_SIZE / 2,
                 radius: GRID_SIZE / 2 - 1,
                 color: 'blue')
    end
  end

  # moves snake by pushing position into the position array and shifting end
  # of the snake from position array.
  def move
    @positions.shift
    case @direction
    when 'down'
      @positions.push(new_coords(head[0], head[1] + 1))
    when 'up'
      @positions.push(new_coords(head[0], head[1] - 1))
    when 'left'
      @positions.push(new_coords(head[0] - 1, head[1]))
    when 'right'
      @positions.push(new_coords(head[0] + 1, head[1]))
    end
  end

  # creates a check to keypush. the snake should not be able to turn upon
  # itself.
  def can_change_direction_to?(new_direction)
    case @direction
    when 'up' then new_direction != 'down'
    when 'down' then new_direction != 'up'
    when 'left' then new_direction != 'right'
    when 'right' then new_direction != 'left'
    end
  end

  # marks head x position used in collision detection
  def x
    head[0]
  end

  # marks head y position used in collision detection
  def y
    head[1]
  end

  # adds to tail
  def grow
    case @direction
    when 'down'
      @positions.push(new_coords(head[0], head[1] + 1))
    when 'up'
      @positions.push(new_coords(head[0], head[1] - 1))
    when 'left'
      @positions.push(new_coords(head[0] - 1, head[1]))
    when 'right'
      @positions.push(new_coords(head[0] + 1, head[1]))
    end
  end

  # check for collision
  def collision?
    @positions.length != @positions.uniq.length ||
      (head[0].zero? || head[0] == GRID_HEIGHT) ||
      (head[1].zero? || head[1] == GRID_WIDTH)
  end

  private

  # allows the snake to wrap around window if it travels off screen
  def new_coords(x, y)
    [x % GRID_WIDTH, y % GRID_HEIGHT]
  end

  # allocates head in position array
  def head
    @positions.last
  end
end
