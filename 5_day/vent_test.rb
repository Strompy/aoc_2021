require 'minitest/autorun'
require 'minitest/pride'
require './vent'

class VentTest < MiniTest::Test
  def setup
    @vent = Vent.new('test_input.txt')
  end

  def test_it_can_readlines

  end
end
