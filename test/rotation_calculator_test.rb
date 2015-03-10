require_relative 'test_helper'
require_relative '../lib/rotation_calculator'

class RotationCalculatorTest < Minitest::Test
  def test_it_exists
   assert RotationCalculator.new
  end

  def test_it_responds_to_rotation
    rotation_calc = RotationCalculator.new
    assert rotation_calc.respond_to?(:rotation)
  end

  def test_rotation_returns_a_hash
    rotation_calc = RotationCalculator.new
    assert_instance_of Hash, rotation_calc.rotation('12345')
  end

  def test_rotation_returns_rotation_keys
    rotation_calc = RotationCalculator.new
    result =  {:a=>12, :b=>23, :c=>34, :d=>45}
    assert_equal result, rotation_calc.rotation('12345')
  end

  def test_rotation_returns_different_rotation_keys
    rotation_calc = RotationCalculator.new
    result =  {:a=>98, :b=>87, :c=>76, :d=>65}
    assert_equal result, rotation_calc.rotation('98765')
  end

  def test_a_rotatation_is_equal_to_index_0_and_1_of_encryption
    rotation_calc = RotationCalculator.new
    assert_equal 12, rotation_calc.rotation('12345')[:a]
    assert_equal 98, rotation_calc.rotation('98765')[:a]
    assert_equal 56, rotation_calc.rotation('56789')[:a]
  end

  def test_b_rotatation_is_equal_to_index_1_and_2_of_encryption
    rotation_calc = RotationCalculator.new
    assert_equal 23, rotation_calc.rotation('12345')[:b]
    assert_equal 87, rotation_calc.rotation('98765')[:b]
    assert_equal 67, rotation_calc.rotation('56789')[:b]
  end

  def test_c_rotatation_is_equal_to_index_2_and_3_of_encryption
    rotation_calc = RotationCalculator.new
    assert_equal 34, rotation_calc.rotation('12345')[:c]
    assert_equal 76, rotation_calc.rotation('98765')[:c]
    assert_equal 78, rotation_calc.rotation('56789')[:c]
  end

  def test_d_rotatation_is_equal_to_index_3_and_4_of_encryption
    rotation_calc = RotationCalculator.new
    assert_equal 45, rotation_calc.rotation('12345')[:d]
    assert_equal 65, rotation_calc.rotation('98765')[:d]
    assert_equal 89, rotation_calc.rotation('56789')[:d]
  end
end
