require 'pry'

class Dive
  def initialize(input)
    @values = File.readlines(input).map(&:to_s)
    @horizontal = 0
    @depth = 0
  end

  def diver()
    @values.each do |value|
      navigator(value)
    end
    puts "horizontal: " +  @horizontal.to_s + " depth: " + @depth.to_s
    puts "answer: " + ( @horizontal * @depth ).to_s

  end

  def navigator(instruction)
    instructions = instruction.split
    direction = instructions[0]
    distance = instructions[1].to_i

    case direction
    when 'forward'
        @horizontal += distance
    when 'down'
        @depth += distance
    when 'up'
        @depth -= distance
    end
  end
end


Dive.new('./input.txt').diver
