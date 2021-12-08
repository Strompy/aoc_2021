require 'minitest/autorun'
require 'minitest/pride'
require './laternfish'

class LaternfishTest < Minitest::Test
  def setup
    @fish = Laternfish.new('test_input.txt')
  end

  def test_it_can_read_lines

  end
end
