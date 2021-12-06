require 'minitest/autorun'
require 'minitest/pride'
require './giant_squid'

class GiantSquidTest < MiniTest::Test
  def setup
    @squid = GiantSquid.new('test_input.txt')
  end

  def test_it_can_read_lines
    assert_equal 3, @squid.boards.size
    # assert_equal 25, @squid.called_nums.size
    #  ^^ Get the real count for calls
  end
end
