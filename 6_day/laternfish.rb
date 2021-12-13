class Laternfish
  attr_reader :school

  def initialize(input)
    fishes = File.read(input)
    @school = (0..8).map do |day|
      fishes.count(day.to_s)
    end
  end

  def simulate_days(days)
    days.times do |day|
      @school.rotate!
      @school[6] += school[8]
    end
  end

  def count_fish
    @school.sum
  end
end

s = Laternfish.new('input.txt')
s.simulate_days(256)
puts s.count_fish

1,738,377,086,345
