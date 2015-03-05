require_relative 'test_helper'
require_relative '../lib/rotator'


class RotatorTest < Minitest::Test

  def test_it_exists
   assert Rotator.new
  end

  def test_it_responds_to_char_map
    rotator = Rotator.new
    assert rotator.respond_to?(:char_map)
  end

  def test_character_map_is_an_array
   rotator = Rotator.new
   assert_equal Array, rotator.char_map.class
  end

  def test_character_map_has_39_characters
   rotator = Rotator.new
   assert_equal 39, rotator.char_map.length
  end
end
