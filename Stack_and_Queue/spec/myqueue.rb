class MyQueue
  attr_accessor :head, :tail

  def initialize
    @queue = Array.new
    @head = @queue[0]
  end

  def enqueue(element)
    @queue.unshift(element)
    if size == 1
      @head = element
    end
    @tail = element
  end

  def dequeue
    @queue.pop
    @head = @queue[@queue.size - 1]
  end

  def size
    @queue.size
  end

  def empty?
    @queue.empty?
  end

end

q = MyQueue.new
q.enqueue("Rich")
puts q.empty?
q.dequeue
puts q.empty?



