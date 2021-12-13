class Whales
  attr_reader :crabs

  def initialize(input)
    @crabs = IO.read(input).split(',').map(&:to_i)
  end
  # Part 1
  def calculate_fuel
    median = calculate_median(@crabs.sort)
    crabs.sum do |crab|
      (crab - median).abs
    end
  end

  def calculate_median(nums)
    size = nums.size
    ((nums[(size - 1) / 2] + nums[size / 2]) / 2)
  end
  #  Part 2
  def calculate_increasing_fuel
    mean = calculate_mean(@crabs.sort)
    crabs.sum do |crab|
      change = (crab - mean).abs
      change * (change + 1) / 2
    end
  end

  def calculate_mean(nums)
    (nums.sum / nums.size).round
  end
end

puts Whales.new('input.txt').calculate_fuel
puts Whales.new('input.txt').calculate_increasing_fuel
