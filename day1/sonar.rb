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

def window_depther(input)
  # current = myself plus the next two
  # is current greater than prev?
  # if so plus 1 to total
  # set prev to current
  values = File.readlines(input).map(&:to_i)

  prev = nil
  current = 0
  total = 0
  values.each_with_index do |i,k|
    current = i + values[k+1].to_i + values[k+2].to_i
    if (prev!=nil && current > prev)
      total += 1
    end
    prev = current
  end
  puts total
end

window_depther("./input.txt")
