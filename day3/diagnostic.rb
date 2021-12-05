require 'pry'

class Diagnostic
  def initialize(input)
    @values = File.readlines(input)
    @gamma = ""
    @epsilon = ""
  end

  def gamma_counter
    @values[0].chomp.length.times do |i|
      binary_abacus = {0 => {count: 0, items: []}, 1 => {count: 0, items: []}}
      @values.each do |value|
        if value[i] == "0"
          binary_abacus[0][:count] += 1
          binary_abacus[0][:items] << value
        else
          binary_abacus[1][:count] += 1
          binary_abacus[1][:items] << value
        end
      end
      max = binary_abacus.max { |a, b| comparator(a,b) }[0]
      @values = binary_abacus[max][:items]
    end

    puts "oxygen generator: " + @values[0].to_i(2).to_s
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

Diagnostic.new('./test.txt').gamma_counter
