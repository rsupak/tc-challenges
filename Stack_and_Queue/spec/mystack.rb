class MyStack
  attr_accessor :top

  def initialize
    @stack = Array.new
    @top = nil
  end

  def push(item)
    @stack << (item)
    @top = @stack.last
  end

  def pop
    item = @stack.pop
    @top = @stack.last
    item
  end

  def empty?
    @stack.empty?
  end
end

s = MyStack.new
s.push("Rich")
s.push(42)
puts s.pop
puts s.empty?
s.pop
puts s.empty?
p s
