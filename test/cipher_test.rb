require_relative 'test_helper'
require_relative '../lib/cipher'

class CipherTest < Minitest::Test
  def test_it_exists
    rotator = Rotator.new(41521, 20315)
    assert Cipher.new("abcd", rotator)
  end

  def test_it_encrypts_a_message
    rotator = Rotator.new(41521, 20315)
    cipher = Cipher.new("abcd", rotator)
    assert_equal "lsr3", cipher.encrypt
  end

  def test_it_decrypts_a_message
    rotator = Rotator.new(41521, 20315)
    cipher = Cipher.new("lsr3", rotator)
    assert_equal "abcd", cipher.decrypt
  end

  # def test_it_rotates_a_position_forward_50_remainder_39_equals_11_chars
  #   skip
  #   rotator = Rotator.new(41521, 20315)
  #   cipher = Cipher.new("lsr3", rotator)
  #   assert_equal 11, cipher.rotate_forward('a', 0)
  # end
  #
  # def test_it_rotates_a_position_backwards_28_chars
  #   skip
  #   rotator = Rotator.new(41521, 20315)
  #   cipher = Cipher.new("lsr3", rotator)
  #   assert_equal 28, cipher.rotate_backward('a', 0)
  # end
end
