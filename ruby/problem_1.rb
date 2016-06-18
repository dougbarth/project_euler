# Problem 1
#
# If we list all the natural numbers below 10 that are multiples of 3 or 5, we
# get 3, 5, 6 and 9. The sum of these multiples is 23.
#
# Find the sum of all the multiples of 3 or 5 below 1000.

require 'test/unit'

def problem_1(limit)
  (1...limit).
    select { |n| n % 3 == 0 || n % 5 == 0 }.
    inject(0) { |sum, n| sum + n }
end

class Problem1 < Test::Unit::TestCase
  def test_problem_statement
    assert_equal 23, problem_1(10)
  end

  def test_question
    assert_equal 233168, problem_1(1000)
  end
end
