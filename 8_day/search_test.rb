require 'minitest/autorun'
require 'minitest/pride'
require './search'

class SearchTest < Minitest::Test
  def setup
    @s = Search.new('test_input.txt')
  end

  def test_it_can_read_lines
    assert_equal 10, @s.inputs.size
  end

  def test_it_can_count_digits
    assert_equal 2, @s.count_digits(@s.inputs.first)
  end

  def test_it_can_solve_part_1
    assert_equal 26, @s.solve_part_1
  end

  def test_it_can_solve_part_2
    assert_equal 61229, @s.solve_part_2
  end
end
