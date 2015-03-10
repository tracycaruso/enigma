require_relative 'test_helper'
require_relative '../lib/enigma'

class EnigmaTest < Minitest::Test
  def test_it_exists
    rotator = Rotator.new(41521, 20315)
    assert Enigma.new("abcd", rotator)
  end

  def test_it_encrypts_a_message
    rotator = Rotator.new(41521, 20315)
    enigma = Enigma.new("abcd", rotator)
    assert_equal "lsr3", enigma.encrypt
  end

  def test_it_decrypts_a_message
    rotator = Rotator.new(41521, 20315)
    enigma = Enigma.new("lsr3", rotator)
    assert_equal "abcd", enigma.decrypt
  end

  # def test_it_rotates_a_position_forward_50_remainder_39_equals_11_chars
  #   skip
  #   rotator = Rotator.new(41521, 20315)
  #   enigma = Enigma.new("lsr3", rotator)
  #   assert_equal 11, enigma.rotate_forward('a', 0)
  # end
  #
  # def test_it_rotates_a_position_backwards_28_chars
  #   skip
  #   rotator = Rotator.new(41521, 20315)
  #   enigma = Enigma.new("lsr3", rotator)
  #   assert_equal 28, enigma.rotate_backward('a', 0)
  # end
end
