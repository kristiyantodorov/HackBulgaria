def prepare_meal(number)
  num = number ** 1/3.0
  result = 1.upto(number ** (1/3.0)).to_a
  result.select { |divisor| number % (divisor ** 3) == 0 }
  result = result[-1]
  result.times { puts "spam" }
end

prepare_meal(7)
