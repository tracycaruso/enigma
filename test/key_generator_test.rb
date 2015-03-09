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
end
