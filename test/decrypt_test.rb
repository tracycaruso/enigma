require_relative 'test_helper'
require_relative '../lib/decrypt'

class DecryptTest < Minitest::Test
  def test_it_exists
    assert Decrypt.new('encrypted.txt', 'decrypted.txt', 82648, 030415)
  end

  def test_decrypt_message_returns_a_string
    decrypt = Decrypt.new('encrypted.txt', 'decrypted.txt', 82648, 030415)
    assert_instance_of String, decrypt.decrypt_message
  end

  def test_it_responds_to_write_file
    decrypt = Decrypt.new('encrypted.txt', 'decrypted.txt', 82648, 030415)
    assert decrypt.respond_to?(:write_file)
  end

  def test_write_file_includes_a_file
    decrypt = Decrypt.new('encrypted.txt', 'decrypted.txt', 82648, 030415)
    assert_instance_of NilClass, decrypt.write_file
  end

  def test_success_message_returns_a_string
    decrypt = Decrypt.new('encrypted.txt', 'decrypted.txt', 82648, 030415)
    assert_instance_of String, decrypt.success_message
  end
end
