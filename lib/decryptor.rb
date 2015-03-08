require_relative './rotator.rb'
class Decryptor

  attr_reader :rotator, :chars, :number_of_chars

  def initialize
    @rotator          =   Rotator.new
    @chars            =   [*("a".."z"), *("0".."9"), " ", ".", ","]
    @number_of_chars  =   @chars.length
  end

  def decryptor(input)
    input.each_with_index do |letter, index|
      input[index] = chars[new_character_index(letter, index)]
    end
  end

  def new_character_index(letter, index)
   (character_location(letter) - rotator.rotation_value(index)) % number_of_chars
  end

  def character_location(input)
    chars.index(input)
  end

end


# tester = Decryptor.new
# print tester.decryptor(["l", "s", "r", "3"])
