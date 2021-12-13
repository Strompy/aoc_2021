require 'minitest/autorun'
require 'minitest/pride'
require './whales'

class WhalesTest < Minitest::Test
  def setup
    @whales = Whales.new('test_input.txt')
  end

  def test_it_can_read_lines
    
  end
end
