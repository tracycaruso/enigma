require_relative './rotator.rb'
class Decryptor

  attr_reader :input

  def initialize
    @total_rotation = Rotator.new
    @total_rotation = @total_rotation.total_rotation_values
    @chars =   [*('a'..'z'), *('0'..'9'), ' ', '.', ',']
  end

  def decryptor(input)
    input.each_index do |i|
      case
      when i % 4 == 0 then input[i] = @chars[@chars.index(input[i]) - @total_rotation[:a] % 39]
      when i % 4 == 1 then input[i] = @chars[@chars.index(input[i]) - @total_rotation[:b] % 39]
      when i % 2 == 0 then input[i] = @chars[@chars.index(input[i]) - @total_rotation[:c] % 39]
      when i % 2 == 1 then input[i] = @chars[@chars.index(input[i]) - @total_rotation[:d] % 39]
      end
    end
  end


end


tester = Decryptor.new
puts tester.decryptor(["l", "s", "r", "3"])
