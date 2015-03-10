require_relative 'test_helper'
require_relative '../lib/encrypt'

class EncryptTest < Minitest::Test
  def test_it_exists
    assert Encrypt.new('message.txt', 'encrypted.txt')
  end

  def test_encrypt_message_returns_a_string
    encrypt = Encrypt.new('message.txt', 'encrypted.txt')
    assert_instance_of String, encrypt.encrypt_message
  end

  def test_it_responds_to_write_file
    encrypt = Encrypt.new('message.txt', 'encrypted.txt')
    assert encrypt.respond_to?(:write_file)
  end

  def test_write_file_includes_a_file
    encrypt = Encrypt.new('message.txt', 'encrypted.txt')
    assert_instance_of NilClass, encrypt.write_file
  end

  def test_success_message_returns_a_string
    encrypt = Encrypt.new('message.txt', 'encrypted.txt')
    assert_instance_of String, encrypt.success_message
  end
end
