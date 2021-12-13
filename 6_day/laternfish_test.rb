require 'minitest/autorun'
require 'minitest/pride'
require './laternfish'

class LaternfishTest < Minitest::Test
  def setup
    @fish = Laternfish.new('test_input.txt')
  end

  def test_it_can_read_lines
    assert_equal 9, @fish.school.size
    assert_equal 2, @fish.school[3]
  end

  def test_it_can_simulate_days
    @fish.simulate_days(18)
    assert_equal 26, @fish.count_fish

    @fish = Laternfish.new('test_input.txt')
    @fish.simulate_days(80)
    assert_equal 5934, @fish.count_fish

    @fish = Laternfish.new('test_input.txt')
    @fish.simulate_days(256)
    assert_equal 26984457539, @fish.count_fish
  end
end
