def max_range(arr, w)
  current_max_range = nil
  (arr.length-w+1).times do |index|
    window = arr[index,w]
    range = window.max - window.min
    current_max_range = range if current_max_range.nil? || range > current_max_range
  end
  current_max_range
end


def max_range2(arr, w)
  current_max_range = nil
  queue = MinMaxStackQueue.new
  # queue.enqueue(arr.shift) until queue.size == w
  arr.each do |el|
    queue.dequeue if queue.size == w
    queue.enqueue(el)
    next if queue.size < w
    range = queue.find_max - queue.find_min
    current_max_range = range if current_max_range.nil? || range > current_max_range
  end
  current_max_range
end


class MyQueue
  def initialize
    @store = []
  end

  def enqueue(val)
    @store << val
  end

  def dequeue
    @store.shift
  end

  def peek
    @store.first
  end

  def size
    @store.size
  end

  def empty?
    @store.empty?
  end
end

class MyStack
  def initialize
    @store = []
  end

  def push(val)
    @store << val
  end

  def pop
    @store.pop
  end

  def peek
    @store.last
  end

  def size
    @store.size
  end

  def empty?
    @store.empty?
  end
end

class StackQueue
  def initialize
    @stack1 = MyStack.new
    @stack2 = MyStack.new
  end

  def enqueue(val)
    @stack1.push(val)
  end

  def dequeue
    @stack2.push(@stack1.pop) until @stack1.empty?
    val = @stack2.pop
    @stack1.push(@stack2.pop) until @stack2.empty?
    val
  end

  def size
    @stack1.size
  end

  def empty?
    @stack1.empty?
  end

end


class MaxStack < MyStack
  def initialize
    super
    @max = []
  end

  def find_max
    @max.last
  end

  def push(val)
    super
    @max << (@max.empty? || val > find_max ? val : find_max)
  end

  def pop
    @max.pop
    super
  end
end


class MinMaxStack < MaxStack
  def initialize
    super
    @min = []
  end

  def find_min
    @min.last
  end

  def push(val)
    super
    @min << (@min.empty? || val < find_min ? val : find_min)
  end

  def pop
    @min.pop
    super
  end
end

class MinMaxStackQueue
  def initialize
    @stack1 = MinMaxStack.new
    @stack2 = MinMaxStack.new
  end

  def enqueue(el)
    @stack1.push(el)
  end

  def dequeue
    @stack2.push(@stack1.pop) until @stack1.empty?
    val = @stack2.pop
    @stack1.push(@stack2.pop) until @stack2.empty?
    val
  end

  def find_min
    @stack1.find_min
  end

  def find_max
    @stack1.find_max
  end

  def size
    @stack1.size
  end
end

a = (1..1400).to_a.shuffle
puts "Slower:"
start = Time.now
p max_range(a, 12)
puts Time.now - start
puts "Faster:"
start = Time.now
p max_range2(a, 12)
puts Time.now - start
