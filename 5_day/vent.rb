class Vent
  attr_reader :coords

  def initialize(input)
    @coords = IO.readlines(input).map do |line|
      line.split(' -> ').map { |coord| coord.split(',').map(&:to_i) }
    end
  end

  def find_lines(diagonals = false)
    points = Hash.new(0)
    coords.each do |(x1, y1), (x2, y2)|
      if x1 == x2 || y1 == y2
        h1, h2 = [x1, x2].sort
        v1, v2 = [y1, y2].sort
        (h1..h2).each do |x|
          (v1..v2).each do |y|
            points[[x, y]] += 1
          end
        end
      elsif diagonals
        points[[x1, y1]] += 1
        while x1 < x2 do
         if y1 < y2
           y1 += 1
         else
           y1 -= 1
         end
         x1 += 1
         points[[x1, y1]] += 1
        end
        while x1 > x2 do
         if y1 < y2
           y1 += 1
         else
           y1 -= 1
         end
         x1 -= 1
         points[[x1, y1]] += 1
        end
      end
    end
    points
  end

  def solve(points)
    points.count do |_, count|
      count > 1
    end
  end
end

v = Vent.new('input.txt')
points = v.find_lines(true)
puts v.solve(points)
