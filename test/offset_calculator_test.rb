require_relative 'test_helper'
require_relative '../lib/offset_calculator'

class OffsetCalculatorTest < Minitest::Test
  def test_it_exists
   assert OffsetCalculator.new(122086)
  end

  def test_it_responds_to_offset_generator
    offset_calculator = OffsetCalculator.new(122086)
    assert offset_calculator.respond_to?(:offset_generator)
  end

  def test_offset_generator_returns_offsets_based_on_date
    offset_calculator = OffsetCalculator.new(122086)
    assert_equal [1,3,9,6], offset_calculator.offset_generator
  end

  def test_offset_generator_returns_offsets_for_5_digit_date
    offset_calculator = OffsetCalculator.new(30815)
    assert_equal [4,2,2,5], offset_calculator.offset_generator
  end

  def test_offset_generator_returns_offsets_for_6_digit_date_with_leading_zero
    offset_calculator = OffsetCalculator.new(30815)
    assert_equal [4,2,2,5], offset_calculator.offset_generator
  end

  def test_it_returns_hash_of_offsets
    offset_calculator = OffsetCalculator.new(122086)
    result =  {:a=>1, :b=>3, :c=>9, :d=>6}
    assert_equal result, offset_calculator.offsets
  end

  def test_it_returns_hash_of_offsets_for_5_digit_date
    offset_calculator = OffsetCalculator.new(30815)
    result =  {:a=>4, :b=>2, :c=>2, :d=>5}
    assert_equal result, offset_calculator.offsets
  end

  def test_offset_a_is_set_correctly
    offset_calculator = OffsetCalculator.new(122086)
    offsets = offset_calculator.offsets
    assert_equal 1, offsets[:a]
  end

  def test_offset_b_is_set_correctly
    offset_calculator = OffsetCalculator.new(122086)
    offsets = offset_calculator.offsets
    assert_equal 3, offsets[:b]
  end

  def test_offset_c_is_set_correctly
    offset_calculator = OffsetCalculator.new(122086)
    offsets = offset_calculator.offsets
    assert_equal 9, offsets[:c]
  end

  def test_offset_d_is_set_correctly
    offset_calculator = OffsetCalculator.new(122086)
    offsets = offset_calculator.offsets
    assert_equal 6, offsets[:d]
  end
end
