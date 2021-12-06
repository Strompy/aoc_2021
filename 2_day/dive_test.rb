require 'minitest/autorun'
require 'minitest/pride'
require './dive'

class DiveTester < Minitest::Test
  def test_it_can_read_lines
    sub = Dive.new('test_input.txt')
    assert_equal 6, sub.commands.size
    assert_equal 'forward', sub.commands[0][0]
    assert_equal 5, sub.commands[0][1]
  end

end

# Your horizontal position and depth both start at 0. The steps above would then modify them as follows:
#
#     forward 5 adds 5 to your horizontal position, a total of 5.
#     down 5 adds 5 to your depth, resulting in a value of 5.
#     forward 8 adds 8 to your horizontal position, a total of 13.
#     up 3 decreases your depth by 3, resulting in a value of 2.
#     down 8 adds 8 to your depth, resulting in a value of 10.
#     forward 2 adds 2 to your horizontal position, a total of 15.
#
# After following these instructions, you would have a horizontal position of 15 and a depth of 10. (Multiplying these together produces 150.)
#
# Calculate the horizontal position and depth you would have after following the planned course. What do you get if you multiply your final horizontal position by your final depth?
