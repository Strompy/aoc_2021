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

  # def find_most_common_bit(index)
  #   zeros, ones = 0, 0
  #   numbers.each do |n|
  #     n[index] == '0' ? zeros += 1 : ones += 1
  #   end
  #   zeros > ones ? '0' : '1'
  # end
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
