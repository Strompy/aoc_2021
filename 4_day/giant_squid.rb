class GiantSquid
  def initialize(input)
    @boards = []
    IO.readlines(input).each_with_index do |line, index| # can I iterate based on a split?
      # split("\n\n")
      # Ideally I break the initial input along double breaks
      # First line turns in the to calls by splitting on the commas
      @called_nums = line.split(', ') if index == 0
      # Then split the next lines on single break to create subarrays for each board
      rows = line.split("\n") #should create array of strings
      board = rows.map.split(', ') #should split strings and store in subarrays
      # subarray values should be hashes {number: status}
      @boards << board
    end
    # Parse boards and number calls
    # prior to first line break are the number calls
    # after that each double break are the boards
    # each board is 5x5, with a line break after the row
  end

  # Given the list of number calls, find the board that will win first
  # Winning board: sum all unmarked numbers and multiply by the winning number call

  # build boards (array of arrays?) They have to know which boxes are marked
  # Basic gameplay:
    # iterate throught numbers until a board is_winning? == true
    # when a number is called that value is marked as true (checked)
    # go through each board's numbers and turn any matching number to true
    # after marking each board, check for a winner, if there is a winner break and return board and final number
end
