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
        neighbors << check_point(row + 1, col + 0) # down
        neighbors << check_point(row - 1, col + 0) # up
        neighbors << check_point(row + 0, col - 1) # left
        neighbors << check_point(row + 0, col + 1) #right
        low_points << point if neighbors.all? { |n| n > point }
      end
    end
    low_points
  end

  def check_point(row, col)
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


  def find_basin_size(location, grid, visited, max)
    # basin_size = 1
    # get adjacent neighbors(location, max)
    # iterate through adjacent neighbors
      # if adjacent neighbor has not been visited
        # add to visited list
        # if adj_neighbor != 9
          # basin_size += find_basin(adj_neighbor, grid, visited, max)
        # end
      # end
      # basin_size
  end

  def solve_part_2
    # basins = []
    # visited = []
    # find_low_points.each do |point|
      # visited << point
      # basins << find_basin_sizes(point, grid, visited, max)

    # end
    # basins.max(3).inject(:*)
  end

  def find_basin_sizes
    basin_sizes = []
    basin_points = []
    checked = []
    @grid.each_with_index do |line, row|
      line.each_with_index do |point, col|
        # require "pry"; binding.pry if col == 9
        next if checked.include?([row, col])
        if check_point(row, col) == 9 || col + 1 >= col_max
          search_down(row, col, basin_points, checked) if col + 1 >= col_max
          require "pry"; binding.pry if !basin_points.empty?
          checked << [row, col]
          basin_sizes << basin_points.size unless basin_points.empty?
          basin_points = []
          next
        end
        search_down(row, col, basin_points, checked)
      end
    end
    require "pry"; binding.pry
  end
  # start at 0,0
  # if neighbor != 9 check_point down one more, repeat
  # return when hit 9
  # check_point right
  # cache neighbor point
  # check_point right one more, repeat
  # return when hit 9

  def search_down(row, col, basin_points = [], checked)
    point = check_point(row, col)
    if checked.include?([row, col])
      return basin_points
    end
    checked << [row, col]
    if point == 9
      # search_down(row, col + 1, basin_points) do I need to check right?
      return basin_points
    else
      basin_points << [row, col]
    end
    search_down(row + 1, col, basin_points, checked)
  end

  # iterate right

  # def search_right(row, col, basin_points = [])
  #   point = check_point(row, col + 1)
  #   if point == 9
  #     return basin_points if point == 9
  #   else
  #     basin_points << [row, col]
  #   end
  #   search_right(row, col + 1, basin_points)
  # end

  def solve_part_2
    basins = find_basin_sizes
    basins.max(3).inject(:*)
  end
end

puts Basin.new('input.txt').find_risk_level
# g.find_risk_level
