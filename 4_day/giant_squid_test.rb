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

  def test_it_can_play
    winner, called_nums = @squid.play
    assert_equal @squid.boards[2], winner
    assert_equal 12, called_nums.size
  end

  def test_it_can_solve
    winner, called_nums = @squid.play
    assert_equal 4512, @squid.solve(winner, called_nums)
  end

  def test_let_the_squid_win
    loser, called_nums = @squid.let_the_squid_win
    assert_equal @squid.boards[1], loser
    assert_equal @squid.numbers[0..14], called_nums
    assert_equal 1924, @squid.solve(loser, called_nums)
  end
end
