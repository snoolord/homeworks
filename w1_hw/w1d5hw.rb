class Stack
  def initialize
    @stack = []
  end

  def add(el)
    @stack << el
  end

  def remove
    @stack.pop
  end

  def show
    @stack
  end
end

class Queue
  def initialize
    @queue = []
  end

  def enqueue(el)
    @queue << el
  end

  def dequeue
    @queue.shift
  end

  def show
    @queue
  end

end

class Map
  def initialize
    @my_map = []
  end

  def assign(key,value)
    already = false
    @my_map.each do |pair|
      if pair[0] == key
        pair[1] = value
        already = true
        return @my_map
      end
    end
    @my_map << [key,value] if already == false
  end

  def lookup(key)
    @my_map.each do |pair|
      if pair[0] == key
        return pair[1]
      end
    end
    nil
  end

  def remove(key)
    @my_map.each_with_index do |pair,index|
      if pair[0] == key
        @my_map.delete_at(index)
      end
    end
  end

  def show
    @my_map
  end
end
