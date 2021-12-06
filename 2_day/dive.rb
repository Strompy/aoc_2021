class Dive
  attr_reader :commands

  def initialize(input)
    @commands = IO.readlines(input).map { |line| d, n = line.split(' '); [d, n.to_i] }
  end

end
