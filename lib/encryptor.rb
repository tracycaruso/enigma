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
    "Encrypted Message : #{input.join}\n"
  end

  def replacement_character(current_letter, letter_position)
    current_rotation = rotator.rotation_value(letter_position)
    (char_map_location(current_letter) + current_rotation) % number_of_chars
  end

  def char_map_location(letter)
    chars.index(letter)
  end

  def keycrack
   "Secret Key : #{rotator.secret_key}\n"
  end

end

tester = Encryptor.new
print tester.keycrack
print tester.encryptor( ["r", "u", "b", "y", "r", "u", "b", "y"] )
