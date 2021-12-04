require 'pry'

class Diagnostic
  def initialize(input)
    @values = File.readlines(input)
    @gamma = ""
    @epsilon = ""
  end

  def gamma_counter
    @values[0].chomp.length.times do |i|
      binary_abacus = {0 => 0, 1 =>0}
      @values.each do |value|
        if value[i] == "0"
          binary_abacus[0] += 1
        else
          binary_abacus[1] += 1
        end
      end
      max = binary_abacus.max { |a, b| a[1] <=> b[1] }[0]
      @gamma += max.to_s
      min = binary_abacus.min { |a, b| a[1] <=> b[1] }[0]
      @epsilon += min.to_s
    end
    puts @gamma.to_i(2) * @epsilon.to_i(2)
  end

end


Diagnostic.new('./input.txt').gamma_counter
