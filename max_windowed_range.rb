def naive_windows(array, w) # array.length = 10, w = 3
  current_max_range = nil
  (0..array.length - w).each do |i| # 8 operations
    sub_arr = array[i...i + w] # 3 operations
    sub_max_range = sub_arr.max - sub_arr.min # 6 operations
    if current_max_range.nil? || current_max_range < sub_max_range #
      current_max_range = sub_max_range
    end
  end
  current_max_range
end

# clarification on time complexity of the solution given for naive_windows (m and n)
# using the min and max methods cost 2 * window_size iterations for each window, are these
# iterations within each other (meaning the time complexities would be multiplied )

p naive_windows([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
p naive_windows([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
p naive_windows([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
p naive_windows([1, 3, 2, 5, 4, 8], 5) == 6

class MyQueue
  def initialize
    @store = []
  end

  def enqueue(el)
    @store.unshift(el)
  end

  def dequeue
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

class MyStack
  def initialize
    @store = []
  end

  def enqueue(el)
    @store.push(el)
  end

  def dequeue
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
