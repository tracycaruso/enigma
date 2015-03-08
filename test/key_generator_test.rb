require_relative 'test_helper'
require_relative '../lib/key_generator'

class KeyGeneratorTest < Minitest::Test

  def test_it_exists
   assert KeyGenerator.new
  end

  def test_key_generator_is_initialized_with_default_key
    key = KeyGenerator.new
    assert_equal 5, key.key.length
  end

  def test_it_responds_to_encryption_generator
    key = KeyGenerator.new
    assert key.respond_to?(:encryption_generator)
  end

  def test_encryption_is_5_characters_long
    key = KeyGenerator.new
    assert_equal 5, key.encryption_generator.length
  end

  def test_creates_different_encryption_key
    key1 = KeyGenerator.new
    key2 = KeyGenerator.new
    refute_equal key1.encryption_generator, key2.encryption_generator
  end

  def test_creates_3_different_encryption_key
    key1 = KeyGenerator.new
    key2 = KeyGenerator.new
    key3 = KeyGenerator.new
    refute_equal key1.encryption_generator, key2.encryption_generator, key3.encryption_generator
  end

end
