# Problem 3
#
# The prime factors of 13195 are 5, 7, 13 and 29.
#
# What is the largest prime factor of the number 600851475143 ?

require 'pry'

# Source: https://en.wikipedia.org/wiki/Primality_test
def prime?(n)
  if n <= 1
    return false
  elsif n <= 3
    return true
  elsif n % 2 == 0 || n % 3 == 0
    return false
  end
  i = 5
  while i*i <= n
    if n % i == 0 || n % (i + 2) == 0
      return false
    end
    i += 6
  end
  return true
end

def primes
  Enumerator.new do |y|
    current = 1
    loop do
      if prime?(current)
        y.yield current
      end
      current += 1
    end
  end
end


def largest_prime_factors(n)
  if prime?(n)
    return [n]
  else
    prime_factor = primes.
      take_while { |p| p <= Math.sqrt(n)}.
      detect { |p| p != 1 && n % p == 0 }

    if prime_factor
      sub_problem = largest_prime_factors(n/prime_factor)
      if sub_problem
        [prime_factor] + sub_problem
      else
        return nil
      end
    else
      return nil
    end
  end
end

if __FILE__ == $0
  require 'test/unit'

  class Problem3 < Test::Unit::TestCase

    def test_prime
      #assert prime?(1)
      assert prime?(2)
      assert prime?(3)
      assert !prime?(4)
      assert prime?(5)
    end

    def test_primes_enumerator
      assert_equal [2,3,5,7,11,13,17,19,23,29], primes.take(10)
    end

    def test_largest_prime_factors
      #assert_equal [1], largest_prime_factors(1)
      assert_equal [2], largest_prime_factors(2)
      assert_equal [3], largest_prime_factors(3)
      assert_equal [2,2], largest_prime_factors(4)
      assert_equal [5], largest_prime_factors(5)
      assert_equal [2,3], largest_prime_factors(6)
      assert_equal [2,2,3], largest_prime_factors(12)
    end

    def test_example
      assert_equal [5,7,13,29], largest_prime_factors(13195)
    end

    def test_question
      assert_equal [71,839,1471,6857], largest_prime_factors(600851475143)
    end
  end
end
