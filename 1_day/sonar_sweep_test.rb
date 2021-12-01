require 'minitest/autorun'
require 'minitest/pride'
require './sonar_sweep'

class SonarSweepTest < Minitest::Test
  def test_it_can_read_lines
    sonar = SonarSweep.new('test_input.txt')
    assert_equal 10, sonar.depths.size
    assert sonar.depths.first.integer?
  end

  def test_it_can_increased_depth?
    sonar = SonarSweep.new('input.txt')
    assert_equal true, sonar.increased_depth?(200, 208)
    assert_equal false, sonar.increased_depth?(210, 200)
  end

  def test_it_can_count_depth_increases

  end
end
