require 'minitest/autorun'
require 'minitest/pride'
require './vent'

class VentTest < MiniTest::Test
  def setup
    @vent = Vent.new('test_input.txt')
  end

  def test_it_can_readlines
    assert_equal 10, @vent.coords.size
    assert_equal [[0, 9], [5, 9]], @vent.coords.first
  end

  def test_number_of_overlaps
    assert_equal 5, @vent.number_of_overlaps
  end
end
