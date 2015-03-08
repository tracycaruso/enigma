#separate character methods and put in new class? Too many dependencies?

require_relative './rotator.rb'
class Encryptor

  attr_reader :rotator, :chars, :number_of_chars

  def initialize
    @rotator          =   Rotator.new
    @chars            =   [*("a".."z"), *("0".."9"), " ", ".", ","]
    @number_of_chars  =   @chars.length
  end

  def encryptor(input)
    input.each_with_index do |letter, position|
      input[position] = chars[replacement_character(letter, position)]
    end
  end

  def replacement_character(letter, position)
    current_rotation = rotator.rotation_value(position)
    (character_location(letter) + current_rotation) % number_of_chars
  end

  def character_location(letter)
    chars.index(letter)
  end

end

tester = Encryptor.new
print tester.encryptor(["a", "b", "c", "d", "."])
