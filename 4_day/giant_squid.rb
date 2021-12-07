class GiantSquid
  attr_reader :boards, :numbers

  def initialize(input)
    @boards = []
    nums, *board_strings = IO.read(input).split("\n\n")
    @numbers = nums.split(',').map(&:to_i)
    @boards = board_strings.map do |board|
      board.split("\n").map do |row|
        row.split(' ').map(&:to_i)
      end
    end
  end

  def winning_board?(board, numbers)
    (board + board.transpose).any? do |line|
      # line.all? { |num| num == 'x' }
      line.all? { |num| numbers.include?(num) }
    end
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
