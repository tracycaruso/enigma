require_relative 'test_helper'
require_relative '../lib/offset_calculator'


class OffsetCalculatorTest < Minitest::Test
  def test_it_exists
   assert OffsetCalculator.new
  end

  def test_it_responds_to_offset_generator
    offset_calculator = OffsetCalculator.new
    assert offset_calculator.respond_to?(:offset_generator)
  end

  def test_offset_generator_returns_offest_keys
    offset_calculator = OffsetCalculator.new
    result =  {:a=>9, :b=>2, :c=>2, :d=>5}
    assert_equal result, offset_calculator.offset_generator([9,2,2,5])
  end

  def test_different_offset_generator_returns_offest_keys
    offset_calculator = OffsetCalculator.new
    result =  {:a=>2, :b=>2, :c=>2, :d=>5}
    assert_equal result, offset_calculator.offset_generator([2,2,2,5])
  end

  def test_offset_a_equals_0_index_in_array
    offset_calculator = OffsetCalculator.new
    assert_equal 9, offset_calculator.offset_generator([9,2,2,5])[:a]
    assert_equal 8, offset_calculator.offset_generator([8,1,4,8])[:a]
    assert_equal 5, offset_calculator.offset_generator([5,3,1,2])[:a]
  end

  def test_offset_b_equals_1_index_in_array
    offset_calculator = OffsetCalculator.new
    assert_equal 2, offset_calculator.offset_generator([9,2,2,5])[:b]
    assert_equal 1, offset_calculator.offset_generator([8,1,4,8])[:b]
    assert_equal 3, offset_calculator.offset_generator([5,3,1,2])[:b]

  end


  def test_offset_c_equals_2_index_in_array
    offset_calculator = OffsetCalculator.new
    assert_equal 2, offset_calculator.offset_generator([9,2,2,5])[:c]
    assert_equal 4, offset_calculator.offset_generator([8,1,4,8])[:c]
    assert_equal 1, offset_calculator.offset_generator([5,3,1,2])[:c]

  end


  def test_offset_d_equals_3_index_in_array
    offset_calculator = OffsetCalculator.new
    assert_equal 5, offset_calculator.offset_generator([9,2,2,5])[:d]
    assert_equal 8, offset_calculator.offset_generator([8,1,4,8])[:d]
    assert_equal 2, offset_calculator.offset_generator([5,3,1,2])[:d]
  end


end
