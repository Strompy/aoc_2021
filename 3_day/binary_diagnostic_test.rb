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

  def test_it_calculate_gamma_rate

  end

  def test_it_calculate_epsilon_rate

  end

  def test_it_can_solve

  end
end
