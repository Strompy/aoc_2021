class Vent
  attr_reader :coords

  def initialize(input)
    @coords = IO.readlines(input).map do |line|
      line.split(' -> ').map { |coord| coord.split(',').map(&:to_i) }
    end
  end

  def number_of_overlaps
    points = Hash.new(0)
    coords.each do |(x1, y1), (x2, y2)|
      h1, h2 = [x1, x2].sort
      v1, v2 = [y1, y2].sort
      if h1 == h2 || v1 == v2
        (h1..h2).each do |x|
          (v1..v2).each do |y|
            points[[x, y]] += 1
          end
        end
      end
    end
    points.count do |_, count|
      count > 1
    end
  end
end
