require 'minitest/autorun'
require 'minitest/pride'
require './search'

class SearchTest < Minitest::Test
  def setup
    @s = Search.new('test_input.txt')
  end

  def test_it_can_read_lines
    # assert_equal
  end
end
