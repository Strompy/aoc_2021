require 'minitest/autorun'
require 'minitest/pride'
require './giant_squid'

class GiantSquidTest < MiniTest::Test
  def setup
    @squid = GiantSquid.new('test_input.txt')
  end

  def test_it_can_read_lines
    assert_equal 3, @squid.boards.size
    assert_equal 27, @squid.numbers.size
  end

  def test_it_can_check_winning_board
    board = @squid.boards[2]
    called_nums = @squid.numbers[0..11]
    @squid.winning_board?(board, called_nums)
  end
end
