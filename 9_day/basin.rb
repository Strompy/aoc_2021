class Basin
  attr_reader :grid, :row_max, :col_max

  def initialize(input)
    @grid = IO.readlines(input).map do |line|
      line.chomp.chars.map(&:to_i)
    end
    @row_max = grid.size
    @col_max = grid.first.size
  end

  def find_low_points
    low_points = []
    @grid.each_with_index do |line, row|
      line.each_with_index do |point, col|
        neighbors = []
        neighbors << check_neighbour(row + 1, col + 0) # down
        neighbors << check_neighbour(row - 1, col + 0) # up
        neighbors << check_neighbour(row + 0, col - 1) # left
        neighbors << check_neighbour(row + 0, col + 1) #right
        low_points << point if neighbors.all? { |n| n > point }
      end
    end
    low_points
  end

  def check_neighbour(row, col)
    return 9 if row < 0 || col < 0
    return 9 if row >= row_max || col >= col_max
    grid[row][col]
  end

  def find_risk_level
    points = find_low_points
    points.sum do |point|
      point + 1
    end
  end
end

puts Basin.new('input.txt').find_risk_level
# g.find_risk_level
