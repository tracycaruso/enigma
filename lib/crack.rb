require_relative './rotator.rb'
class Encryptor

  attr_reader :input

  def initialize
    @rotation_value = Rotator.new.total_rotation_values
    @chars =   [*("a".."z"), *("0".."9"), " ", ".", ","]
  end

  def encryptor(input)
    input.each_index do |i|
      case
      when i % 4 == 0 then input[i] = @chars[(@chars.index(input[i]) + @rotation_value[:a]) % 39]
      when i % 4 == 1 then input[i] = @chars[(@chars.index(input[i]) + @rotation_value[:b]) % 39]
      when i % 2 == 0 then input[i] = @chars[(@chars.index(input[i]) + @rotation_value[:c]) % 39]
      when i % 2 == 1 then input[i] = @chars[(@chars.index(input[i]) + @rotation_value[:d]) % 39]
      end
    end
  end


end


tester = Encryptor.new
print tester.encryptor([".", ".", "e", "n", "d", ".", "."])
