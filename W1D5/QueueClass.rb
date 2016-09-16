class Queue
  def initialize
    @queue = []
  end

  def enqueue(el)
    @queue << el
  end

  def dequeue(el)
    @queue.shift
  end

  def show
    @queue.dup
  end
end
