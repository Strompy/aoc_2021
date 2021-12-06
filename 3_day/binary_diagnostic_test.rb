require 'minitest/autorun'
require 'minitest/pride'
require './binary_diagnostic'

class BinaryDiagnosticTest < MiniTest::Test
  def setup
    @bd = BinaryDiagnostic.new('test_input.txt')
  end

  def test_it_can_read_lines
    assert_equal 12, @bd.numbers.size
  end

  def test_it_can_find_most_common_bit
    assert_equal '1', @bd.find_most_common_bit(0)
  end

  def test_it_calculate_gamma_rate
    @bd.calculate_gamma_rate
    assert_equal '10110', @bd.gamma
  end

  def test_it_calculate_epsilon_rate
    @bd.calculate_epsilon_rate
    assert_equal '01001', @bd.epsilon
  end

  def test_it_can_solve
    @bd.calculate_gamma_rate
    @bd.calculate_epsilon_rate
    assert_equal 198, @bd.solve
  end

  def test_it_can_find_rates
    @bd.find_rates
    assert_equal '10110', @bd.gamma
    assert_equal '01001', @bd.epsilon
    assert_equal 198, @bd.solve
  end
end
