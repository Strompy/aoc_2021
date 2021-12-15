class Search
  attr_reader :inputs, :easy, :hard

  def initialize(input)
    @inputs = {}
    IO.readlines(input).map do |line|
      pattern, output = line.chomp.split(' | ')
      # digits = pattern.split(' ')
      @inputs[pattern] = output
    end
    @easy = {
      2 => 1,
      3 => 7,
      4 => 4,
      7 => 8
    }
    @hard = {
      5 => [2, 3, 5],
      6 => [0, 6, 9]
    }
  end

  def count_digits(line)
    outputs = line.last.split(' ')
    outputs.count do |digit|
      count = digit.size
      digit = easy[count]
      case digit
      when 1, 4, 7, 8
        true
      end
    end
  end

  def solve_part_1
    inputs.sum do |line|
      count_digits(line)
    end
  end

  def solve_part_2
    # use dictionary to crack outputs
    # join outputs into string and then convert to number
    # add all outputs
  end

  def determine_digits
    inputs.sum do |patterns, outputs|
      @dictionary = {}
      digits = patterns.split(' ')
      find_easy(digits)
      find_hard(digits)
      find_hard(digits) if @dictionary.size < 10
      signals = outputs.split(' ')
      nums = signals.map do |signal|
        @dictionary.key(signal.chars.sort.join)
      end
      nums.join.to_i
    end
  end

  def find_easy(digits)
    digits.each do |digit|
      count = digit.size
      number = easy[count]
      @dictionary[number] = digit.chars.sort.join if number
    end
  end

  def find_hard(digits)
    digits.each do |digit|
      count = digit.size
      alpha = digit.chars.sort.join
      case count
      when 5
        # require "pry"; binding.pry if @dictionary[6].nil?
        # next if @dictionary[6].nil?
        if  (@dictionary[7].chars - alpha.chars).empty?
          number = 3
        elsif @dictionary[6].nil?

        elsif (alpha.chars - @dictionary[6].chars).empty?
          number = 5
        else
          number = 2
        end
      when 6
        if (@dictionary[4].chars - alpha.chars).empty?
          number = 9
        elsif (@dictionary[7].chars - alpha.chars).empty?
          number = 0
        else
          number = 6
        end
      end
      @dictionary[number] = alpha if number
    end
  end
end

@s = Search.new('input.txt')
puts @s.determine_digits
