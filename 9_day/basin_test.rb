require 'minitest/autorun'
require 'minitest/pride'
require './basin'

class BasinTest < Minitest::Test
  def setup
    @basin = Basin.new('test_input.txt')
  end
end
