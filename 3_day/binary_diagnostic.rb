class BinaryDiagnostic
  attr_reader :numbers, :gamma,  :epsilon

  def initialize(input)
    @numbers = IO.readlines(input).map(&:chomp)
    @gamma, @epsilon = '', ''
  end
  # part 1
  def find_rates
    numbers.first.size.times do |i|
      zeros, ones = 0, 0
      numbers.each do |n|
        n[i] == '0' ? zeros += 1 : ones += 1
      end
      @gamma << (zeros > ones ? '0' : '1')
      @epsilon << (zeros > ones ? '1' : '0')
    end
  end

  def solve
    @gamma.to_i(2) * @epsilon.to_i(2)
  end

  def oxy_rating
    nums = numbers
    index = 0
    until nums.size == 1
      bit = find_most_common_oxy_bit(nums, index)
      nums = nums.select do |n|
        n[index] == bit
      end
      index += 1
    end
    nums[0]
  end

  def co2_rating
  # To find CO2 scrubber rating, determine the least common value (0 or 1) in the current bit position, and keep only numbers with that bit in that position.
  # If 0 and 1 are equally common, keep values with a 0 in the position being considered.
  nums = numbers
  index = 0
  until nums.size == 1
    bit = find_least_common_co2_bit(nums, index)
    nums = nums.select do |n|
      n[index] == bit
    end
    index += 1
  end
  nums[0]
  end

  def find_most_common_oxy_bit(nums, index)
    zeros, ones = 0, 0
    nums.each do |n|
      n[index] == '0' ? zeros += 1 : ones += 1
    end
    ones >= zeros ? '1' : '0'
  end

  def find_least_common_co2_bit(nums, index)
    zeros, ones = 0, 0
    nums.each do |n|
      n[index] == '0' ? zeros += 1 : ones += 1
    end
    ones >= zeros ? '0' : '1'
  end

  def solve_2
    oxy_rating.to_i(2) * co2_rating.to_i(2)
  end
  #
  # def calculate_gamma_rate
  #   numbers.first.size.times do |i|
  #     @gamma << find_most_common_bit(i)
  #   end
  # end
  #
  # def calculate_epsilon_rate
  #   flip = {'1' => '0', '0' => '1'}
  #   numbers.first.size.times do |i|
  #     @epsilon << flip[find_most_common_bit(i)]
  #   end
  # end

end

bd = BinaryDiagnostic.new('input.txt')
bd.find_rates
puts bd.solve
