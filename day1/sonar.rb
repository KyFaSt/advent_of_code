require 'pry'

def depther(input)
  values = File.readlines(input).map(&:to_i)

  total = 0
  values.each_with_index do |i,k|
    next if values[k-1].nil?
    if (i > values[k-1])
      total += 1
    end
  end
  puts total
end

depther("./input.txt")
