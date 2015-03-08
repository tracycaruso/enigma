#does crack go here too?
require_relative './rotator.rb'
class Engima #CharacterSwapper

  attr_reader :rotator, :chars, :number_of_chars

  def initialize#(key, date) optional arguments?
    @rotator          =   Rotator.new#(key, date)
    @chars            =   [*("a".."z"), *("0".."9"), " ", ".", ","]
    @number_of_chars  =   @chars.length
  end

  def encrypt(input)
    input.each_with_index do |letter, position|
      input[position] = chars[rotate_forward(letter, position)]
    end
  end

  def decrypt(input)
    input.each_with_index do |letter, position|
      input[position] = chars[rotate_backward(letter, position)]
    end
  end

  private

  def rotate_forward(current_letter, letter_position)
    current_rotation = rotator.rotation_value(letter_position)
    (char_map_location(current_letter) + current_rotation) % number_of_chars
  end

  def rotate_backward(current_letter, letter_position)
    current_rotation = rotator.rotation_value(letter_position)
    (char_map_location(current_letter) - current_rotation) % number_of_chars
  end

  def char_map_location(letter)
    chars.index(letter)
  end

  def keycrack
   "Secret Key : #{rotator.secret_key}\n"
  end

end


testing  = Engima.new
print testing.encrypt(["a", "b", "c", "d"])
print testing.decrypt(["l", "s", "r", "3"])
