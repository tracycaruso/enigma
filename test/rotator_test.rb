require_relative 'test_helper'
require_relative '../lib/rotator'


class RotatorTest < Minitest::Test

  def test_it_exists
   assert Rotator.new
  end

  def test_it_responds_to_char_map
    skip
    rotator = Rotator.new
    assert rotator.respond_to?(:char_map)
  end

  def test_character_map_is_an_array
    skip
   rotator = Rotator.new
   assert_equal Array, rotator.char_map.class
  end

  def test_character_map_has_39_characters
    skip
   rotator = Rotator.new
   assert_equal 39, rotator.char_map.length
  end

  def test_it_adds_rotations_and_offsets
    skip
    rotator = Rotator.new
    offsets = {:a=>9, :b=>2, :c=>2, :d=>5}
    rotations = {:a=>12, :b=>23, :c=>34, :d=>45}
    result = {:a=>21, :b=>25, :c=>36, :d=>50}
    assert_equal result, rotator.total_rotation_values(rotations, offsets)
  end

  def test_it_rotates_letters
    #string[0] = c[c.index('a') + 50 % 39] -> l
    #string[1] = c[c.index('b') + 17 % 39] -> s
    #string[2] = c[c.index('c') + 54 % 39] -> r
    #string[3] = c[c.index('d') + 26 % 39] -> 3


    # rotator = Rotator.new
    # assert_equal [l], rotator.rotate
  end


end
