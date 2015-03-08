require_relative './rotator.rb'
class Encryptor

  # attr_reader :input
  #
  # def initialize
  #   @rotation_value = Rotator.new.total_rotation_values
  #   @chars =   [*("a".."z"), *("0".."9"), " ", ".", ","]
  # end
  #
  # def encryptor(input)
  #   input.each_index do |i|
  #     case
  #     when i % 4 == 0 then input[i] = @chars[(@chars.index(input[i]) + @rotation_value[:a]) % 39]
  #     when i % 4 == 1 then input[i] = @chars[(@chars.index(input[i]) + @rotation_value[:b]) % 39]
  #     when i % 2 == 0 then input[i] = @chars[(@chars.index(input[i]) + @rotation_value[:c]) % 39]
  #     when i % 2 == 1 then input[i] = @chars[(@chars.index(input[i]) + @rotation_value[:d]) % 39]
  #     end
  #   end
  # end

  # Get length of string
  # if string length ends in .0 last four digits are ABCD rotations
  # if string length ends in .25 last four digits arE BCDA rotations
  # if string length ends in .50 last four digits are CDAB rotations
  # if string length ends in .75 last four digits are DABC rotations

  # 4th last digit and find its index in char array then subtract from .

  # chs = find index of last four characters
  # starts = find index of last four nd..

  # subtract chs from starts index ex  starts - chs if chs is lower than starts + 39 to number
  # match numbers to abcd values
  # add abcd values to time offsets
  # generate number
  

end


tester = Encryptor.new
print tester.encryptor(["u", "0", "e", "p", "b", "y", "h", "g", "3", "l", " ", "k", " ", "x", "t", "8", "8", "y", "a", "l", "t", "c", "u", "n", "n", "y", "o", "8", "8", "h", "r", "s", "9", "n", "n", "w", "n", "d", ".", "c", "3", "i", ".", "9"])
