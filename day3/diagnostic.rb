require 'pry'

class Diagnostic
  def initialize(input)
    @values = File.readlines(input)
    @oxygen_generator = gamma_counter("max")
    @co2 = gamma_counter("min")

    puts "oxygen generator: " + @oxygen_generator.to_s
    puts "co2 scrubber rating: " + @co2.to_s

    puts "life support rating: " + (@oxygen_generator * @co2).to_s
  end

  def gamma_counter(input)
    values = @values
    values[0].chomp.length.times do |i|
      binary_abacus = {0 => {count: 0, items: []}, 1 => {count: 0, items: []}}
      values.each do |value|
        if value[i] == "0"
          binary_abacus[0][:count] += 1
          binary_abacus[0][:items] << value
        else
          binary_abacus[1][:count] += 1
          binary_abacus[1][:items] << value
        end
      end

      if input == "max"
        max = binary_abacus.max { |a, b| comparator(a,b) }[0]
        values = binary_abacus[max][:items]
      else input == "min"
        min = binary_abacus.min { |a, b| comparator(a,b) }[0]
        values = binary_abacus[min][:items]
      end

      if values.length == 1
        # this should be the last remaining value in the array
        return values[0].to_i(2)
      end
    end
  end

  def comparator(a, b)
    if a[1][:count] == b[1][:count]
      a[0]
    else
      a[1][:count] <=> b[1][:count]
    end
  end
end


# answer to part 1 was 841526
# if you wrote tests, you wouldn't need comments like this

Diagnostic.new('./input.txt')
