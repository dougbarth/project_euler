# Problem 4
#
# A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.
#
# Find the largest palindrome made from the product of two 3-digit numbers.

def is_palindrome?(n)
  i = 0
  j = n.length - 1
  while (i < j)
    if n[i] != n[j]
      return false
    end
    i += 1
    j -= 1
  end
  return true
end

def all_palindromes(num_digits)
  max = 10 ** num_digits - 1
  min = 10 ** (num_digits - 1)
  candidates = min..max

  results = {}

  candidates.reverse_each do |x|
    candidates.reverse_each do |y|
      product = x * y
      if is_palindrome?(product.to_s)
        results[product] = [x,y]
      end
    end
  end

  results
end

def largest_palindrome_product(num_digits)
  all_palindromes(num_digits).keys.sort.last
end

if __FILE__ == $0
  require 'test/unit'

  class Problem4 < Test::Unit::TestCase
    def test_2_digits
      assert_equal 9009, largest_palindrome_product(2)
    end

    def test_3_digits
      assert_equal 906609, largest_palindrome_product(3)
    end
  end
end
