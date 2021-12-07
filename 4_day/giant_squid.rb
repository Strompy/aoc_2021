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
      line.all? { |num| numbers.include?(num) }
    end
  end

  def play
    called_nums = []
    numbers.each do |num|
      called_nums << num
      if called_nums.size >= 5
        winner = boards.find do |board|
          winning_board?(board, called_nums)
        end
        return winner, called_nums unless winner.nil?
      end
    end
  end

  def let_the_squid_win
    called_nums = []
    remaining = boards
    numbers.each do |num|
      called_nums << num
      if called_nums.size >= 5
        loser = remaining
        remaining = remaining.reject do |board|
          winning_board?(board, called_nums)
        end
        return loser[0], called_nums if remaining.empty?
      end
    end
  end

  def solve(board, called_nums)
    board.flatten.reject { |num| called_nums.include?(num) }.sum * called_nums.last
  end
end


s = GiantSquid.new('input.txt')
board, called = s.let_the_squid_win
puts s.solve(board, called)
