require 'minitest/autorun'
require 'minitest/pride'
require './sonar_sweep'

class SonarSweepTest < Minitest::Test
  def test_it_can_read_lines
    sonar = SonarSweep.new('test_input.txt')
    assert_equal 10, sonar.depths.size
    assert sonar.depths.first.integer?
  end

  def test_it_can_count_depth_increases
    sonar = SonarSweep.new('test_input.txt')
    assert_equal 7, sonar.count_depth_increases
  end

  def test_it_can_count_depth_windows
    sonar = SonarSweep.new('test_input.txt')
    assert_equal 5, sonar.count_depth_windows
  end
end
