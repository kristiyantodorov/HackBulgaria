def factorial(number)
  result = 1
  (1.upto(number)).each { |num| result *= num}
  result
end

def recursive_factorial(number)
  if number == 0
    1
  else
    number * recursive_factorial(number - 1)
  end
end

def nth_lucas(n)
  if n == 0
    2
  elsif n == 1
    1
  else
    nth_lucas(n - 1) + nth_lucas(n - 2)
  end
end

def nth_fib(n)
  first, second = 0, 1
  n.times {first, second = second, first + second}
  first
end

def first_lucas(n)
  iter = 0
  result = []

  while iter < n
    result << nth_lucas(iter)
    iter += 1
  end

  result
end

def countDigits(n)
  n.to_s.chars.size
end

def sumDigits(n)
  result = 0
  n.to_s.chars.each { |ch| result += ch.to_i }
  result
end

def factorialDigits(n)
  result = 0
  n.to_s.chars.each { |ch| result += factorial ch.to_i }
  result
end

def fib_number(n)
  result = ''
  (1.upto(n)).each { |digit| result << nth_fib(digit).to_s }
  result
end

def binary(n)
  n.to_s(2).to_i
end

def reverse(n)
  n.to_s.chars == n.to_s.chars.reverse
end

def countOnes(n)
  n.to_s.chars.select { |ch| ch.to_i == 1 }.size
end

def is_hack(n)
  (countOnes(binary n) % 2 != 0) and reverse n 
end

def next_hack(n)
  until is_hack(n + 1)
    n += 1
  end
  n + 1
end

def vowel?(ch)
  vowels = ['a', 'o', 'y', 'e', 'i', 'u']
  vowels += vowels.map { |vow| vow.upcase }
  vowels.include?(ch)
end

def consonant?(ch)
  consonants = ('a'..'z').to_a - ['a', 'o', 'y', 'e', 'i', 'u']
  consonants += consonants.map { |con| con.upcase }
  consonants.include?(ch)
end

def count_consonants(str)
  str.chars.select { |ch| consonant? ch }.size
end

def count_vowels(str)
  str.chars.select { |ch| vowel? ch }.size
end

def palindrome?(n)
  n == n.to_s.reverse.to_i
end

def p_score(n)
  if palindrome? n
    1
  else
    1 + p_score(n + n.to_s.reverse.to_i)
  end
end

def largest_palindrome(n)
  until palindrome? n
    n -= 1
  end
  n
end

def is_prime?(n)
  require 'prime'
  Prime.prime? n
end

def list_first_primes(n)
  2.upto(1.0/0.0).lazy.select { |num| is_prime? num }.first n
end

def is_anagram(a, b)
  a.chars.permutation.include?(b.chars)
end

def balanced(n)
  n = n.to_s.chars.map { |ch| ch.to_i }
  if n.size.odd?
    n.delete_at(n.size / 2)
  end
  n.take(n.size / 2).reduce(:+) == n.drop(n.size / 2).reduce(:+)
end

def zero_insert(n)
  n = n.to_s.chars.map { |ch| ch.to_i }
  iter = 0
  while iter < n.size - 1
    if (n[iter] == n[iter + 1]) or ((n[iter] + n[iter + 1]) % 10 == 0)
      n.insert(iter + 1, 0)
    end
    iter += 1
  end
  result = ""
  n.each { |num| result += num.to_s }
  result.to_i
end
