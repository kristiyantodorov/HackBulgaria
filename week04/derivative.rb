class Monom
  attr_accessor :constant, :power
  def initialize(data)
    @data = data
    @constant = 0
  end

  def normalize
    @data.chars do |ch|
      
    end
  end
end

class Polynom < Monom
  attr_accessor :monoms, :input
  
  def initialize(input)
    @input = input.split '+'
    @monoms = []
    @input.each { |mon| @monoms << Monom.new(mon) }
  end
end

p = Polynom.new '2*x^3+3*x^2+4*x'
p p.normalize
