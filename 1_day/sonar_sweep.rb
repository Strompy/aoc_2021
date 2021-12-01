class SonarSweep
  attr_reader :depths

  def initialize(input)
    @depths = IO.readlines(input).map(&:to_i)
  end

  def count_depth_increases
    depths.each_cons(2).count do |depth_1, depth_2|
      depth_1 < depth_2
    end
  end
end


puts SonarSweep.new('input.txt').count_depth_increases
