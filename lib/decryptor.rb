require_relative './rotator.rb'
class Decryptor

  attr_reader :rotator, :chars, :number_of_chars

  def initialize
    @rotator          =   Rotator.new
    @chars            =   [*("a".."z"), *("0".."9"), " ", ".", ","]
    @number_of_chars  =   @chars.length
  end

  def decryptor(input)
    input.each_with_index do |letter, position|
      input[position] = chars[replacement_character(letter, position)]
    end
    "Decrypted Message : #{input.join}\n"
  end

  def replacement_character(letter, position)
    current_rotation = rotator.rotation_value(position)
    (character_location(letter) - current_rotation) % number_of_chars
  end

  def character_location(letter)
    chars.index(letter)
  end

  def keycrack
   "Secret Key : #{rotator.secret_key}\n"
  end

end


tester = Decryptor.new
print tester.decryptor(["4", "q", "e", "s", "b", "7", "h", "v", "7", "7", "z", "4", "9", "p", "o", "s", "9", "b", "e", "k", "9", "a", "e", "l", "d", "q", "0", "o", "a", "c", "s", "s", "0", "p"] )
