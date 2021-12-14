class Search
  attr_reader :inputs, :lengths

  def initialize(input)
    @inputs = {}
    IO.readlines(input).map do |line|
      pattern, output = line.chomp.split(' | ')
      @inputs[pattern] = output
    end
    @lengths = {
      2 => 1,
      3 => 7,
      4 => 4,
      5 => [2, 3, 5],
      6 => [0, 6, 9],
      7 => 8
    }
  end

  def determine_digits(line)
    # patterns = line.first.split(' ')
    outputs = line.last.split(' ')
    # dictionary = {}
    # require "pry"; binding.pry
    outputs.count do |digit|
      count = digit.size
      digit = lengths[count]
      case digit
      when 1, 4, 7, 8
        true
      end
    end
  end

  def solve_part_1
    inputs.sum do |line|
      determine_digits(line)
    end
  end
end

@s = Search.new('input.txt')
puts @s.solve_part_1
