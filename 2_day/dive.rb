class Dive
  attr_reader :commands, :x, :y

  def initialize(input)
    @commands = IO.readlines(input).map { |line| d, n = line.split(' '); [d, n.to_i] }
    @x, @y, = 0, 0
  end

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

  def solve
    x * y
  end
end


d = Dive.new('input.txt')
d.move
puts d.solve
