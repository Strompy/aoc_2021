class Dive
  attr_reader :commands, :x, :y, :aim

  def initialize(input)
    @commands = IO.readlines(input).map { |line| d, n = line.split(' '); [d, n.to_i] }
    @x, @y, @aim = 0, 0, 0
  end
  # Part 1
  def move
    commands.each do |direction, distance|
      case direction
      when 'forward'
        @x += distance
      when 'up'
        @y -= distance
      when 'down'
        @y += distance
      end
    end
  end

  # part 2
  def aim_move
    commands.each do |direction, distance|
      case direction
      when 'forward'
        @x += distance
        @y += aim * distance
      when 'up'
        @aim -= distance
      when 'down'
        @aim += distance
      end
    end
  end

  def solve
    x * y
  end
end


d = Dive.new('input.txt')
d.move
puts d.solve

d2 = Dive.new('input.txt')
d2.aim_move
puts d2.solve
