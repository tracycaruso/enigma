require 'key_generator'
require 'rotation_calculator'
class Rotator

  def initialize
    key_generator = KeyGenerator.new
    rotation_keys = RotationCalculator.new(key_generator)
    puts rotation_keus
  end

  #modulo 39
  def char_map
    [*('a'..'z'), *(0..9), ' ', '.', ',']
  end
end
