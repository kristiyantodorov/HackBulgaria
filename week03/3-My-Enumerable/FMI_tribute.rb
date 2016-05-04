class NumberSet
  def initialize
    @set = []
  end

  def <<(number)
    @set << number unless @set.include? number
  end

  def size
    @set.size
  end

  def empty?
    @set.size == 0
  end

  def inspect
    @set
  end

  def [](filter)
    filter.call @set
  end
end

class Filter
  def initialize(&block)
    Proc.new
  end
end

numbers = NumberSet.new
numbers << 42
numbers << 43
numbers << 44
numbers << 45
numbers << 46
a = [1, 2, 3]
numbers[Filter.new { |number| number.odd?}]
puts a
