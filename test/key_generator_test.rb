require_relative 'test_helper'
require_relative '../lib/key_generator'

class KeyGeneratorTest < Minitest::Test
  def test_it_exists
    assert KeyGenerator.new
  end

  def test_genertated_key_is_five_characters_long
    key = KeyGenerator.new
    assert_equal 5, key.generate_key.length
  end

  def test_it_generates_a_random_key
    key = KeyGenerator.new
    keys = 10.times.map { key.generate_key }
    assert_equal keys.length, keys.uniq.length
  end

  def test_that_key_is_an_string
    key = KeyGenerator.new
    assert_instance_of String, key.generate_key
  end

  def test_it_can_start_with_zero
    key = KeyGenerator.new
    keys = 1000.times.map { key.generate_key }
    start_with_zero = keys.find_all{|key| key[0] == "0"}
    assert start_with_zero.length > 1
  end
end
