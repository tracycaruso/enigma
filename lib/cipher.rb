require_relative './rotator.rb'

class Cipher
  attr_reader :message, :rotator, :chars, :number_of_chars, :lines

  def initialize(message, rotator)
    @message          =  message
    @rotator          =  rotator
    @chars            =  [*("a".."z"), *("0".."9"), " ", ".", ","]
    @number_of_chars  =  @chars.length
  end

  def encrypt
    encrypted = message.chars.map.with_index do |letter, position|
      chars[rotate_forward(letter, position)]
    end
    encrypted.join
  end

  def decrypt
    decrypted = message.chars.map.with_index do |letter, position|
      chars[rotate_backward(letter, position)]
    end
    decrypted.join
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
end
