require_relative 'test_helper'
require_relative '../lib/rotator'

class RotatorTest < Minitest::Test
  attr_reader :rotator

  def setup
    @rotator = Rotator.new(12345, 110815)
  end

  def test_it_exists
    assert rotator
  end

  def test_it_adds_rotations_and_offsets
    result = {:a=>16, :b=>25, :c=>36, :d=>50}
    assert_equal result, rotator.total_rotation_values
  end

  def test_it_returns_the_a_rotation_for_index_0
    assert_equal 16, rotator.rotation_value(0)
  end

  def test_it_returns_the_b_rotation_for_index_1
    assert_equal 25, rotator.rotation_value(1)
  end

  def test_it_returns_the_c_rotation_for_index_2
    assert_equal 36, rotator.rotation_value(2)
  end

  def test_it_returns_the_d_rotation_for_index_3
    assert_equal 50, rotator.rotation_value(3)
  end
end
