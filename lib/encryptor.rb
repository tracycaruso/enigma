require_relative './rotator.rb'
class Encryptor

  attr_reader :input

  def initialize
    @total_rotation = Rotator.new
    @total_rotation = @total_rotation.total_rotation_values
    @chars =   [*("a".."z"), *("0".."9"), " ", ".", ","]
  end

  def encryptor(input)
    input.each_index do |i|
      case
      when i % 4 == 0 then input[i] = @chars[(@chars.index(input[i]) + @total_rotation[:a]) % 39]
      when i % 4 == 1 then input[i] = @chars[(@chars.index(input[i]) + @total_rotation[:b]) % 39]
      when i % 2 == 0 then input[i] = @chars[(@chars.index(input[i]) + @total_rotation[:c]) % 39]
      when i % 2 == 1 then input[i] = @chars[(@chars.index(input[i]) + @total_rotation[:d]) % 39]
      end
    end
  end


end


tester = Encryptor.new
# print tester.encryptor(["a", "b", "c", "d", "."])
print tester.encryptor([".", ".", "e", "n", "d", ".", "."])
