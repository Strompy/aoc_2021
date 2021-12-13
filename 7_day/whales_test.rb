require 'minitest/autorun'
require 'minitest/pride'
require './whales'

class WhalesTest < Minitest::Test
  def setup
    @whale = Whales.new('test_input.txt')
  end

  def test_it_can_read_lines
    assert_equal 10, @whale.crabs.size
    assert_equal 16, @whale.crabs.first
  end

  def test_it_can_calculate_fuel
    assert_equal 37, @whale.calculate_fuel
  end
end
