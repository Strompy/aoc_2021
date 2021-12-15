require 'minitest/autorun'
require 'minitest/pride'
require './basin'

class BasinTest < Minitest::Test
  def setup
    @basin = Basin.new('test_input.txt')
  end

  def test_it_can_read_lines
    assert_equal 5, @basin.grid.size
    assert_equal 10, @basin.grid.first.size
  end

  def test_it_can_find_low_points
    assert_equal [1, 0, 5, 5], @basin.find_low_points
  end

  def test_it_can_find_risk_level
    assert_equal 15, @basin.find_risk_level
  end
end
