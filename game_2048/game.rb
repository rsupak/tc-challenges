require 'ruby2d'

set height: 480, width: 480, background: 'white'
set fps_cap: 10

block = Square.new(color: '#FFDEAD', x: 0, y: Window.height - 100, size: 100)

on :key_down do |event|
  close if event.key == 'q'
  block.x = Window.width - block.size if event.key == 'right'
  block.y = 0 if event.key == 'up'
  block.x = 0 if event.key == 'left'
  block.y = Window.height - block.size if event.key == 'down'
end

show
