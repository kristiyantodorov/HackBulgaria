# Implementation of our own Enumerable class
module MyEnumerable
  def map
    result = []
    each do |x| 
      result << yield
    end
    result
  end
  
  def filter(&block)
    result = []
    each do |x|
      result << x if block.call x
    end
    result
  end

  def reject(&block)
    result = []
    each do |x|
      result << x unless block.call x
    end
    result end

  def reduce(initial = nil, &block)
    each do |x|
      initial = block.call initial, x
    end
    initial
  end

  def any?(&block)
    each do |x| 
      if (block.call x) == true
        return true
      end
    end
    false
  end

  def all?(&block)
    each do |x| 
      if (block.call x) == false
        return false
      end
    end
    true
  end

  def include?(element)
    each do |x| 
      if x == element
        return true
      end
    end
  end

  def count(element = nil)
    if element
      count = 0
      each do |x|
        count += 1 if x == element
      end
      count
    else
      @data.size
    end
  end

  def size(*args)
    result = 0
    each { |x| result += 1}
    result
  end

  def min
    
  end

  def min_by
    # Your code goes here.
  end

  def max
    # Your code goes here.
  end

  def max_by
    # Your code goes here.
  end

  def take(n)
    count = 0
    result = []
    each do |x|
      break if count == n
      result << x
      count += 1
    end
    result
  end

  def take_while(&block)
    result = []
    each do |x|
      break unless block.call x
      result << x
    end
    result
  end

  def drop(n)
    count = 0
    result = []
    each do |x|
      (result << x) if count >= n
      count += 1
    end
    result
  end

  def drop_while(&block)
    result = []
    each do |x|
      result << x unless block.call x
    end
    result
  end
end
