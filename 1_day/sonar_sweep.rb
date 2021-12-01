class SonarSweep
  attr_reader :depths
  def initialize(input)
    @depths = IO.readlines(input).map(&:to_i)
  end

  def increased_depth?(first_depth, second_depth)
    first_depth < second_depth
  end
end
