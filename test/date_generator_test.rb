require_relative 'test_helper'
require_relative '../lib/date_generator'

class DateGeneratorTest < Minitest::Test

  def test_it_exists
   assert DateGenerator.new
  end

  def test_it_responds_to_date_converter
    date = DateGenerator.new
    assert date.respond_to?(:date_converter)
  end

  def test_date_equals_today
    skip
    date = DateGenerator.new
    assert_equal "30515", date.date_converter("0305jh")
  end

  def test_it_responds_to_date_squared
    date = DateGenerator.new
    assert date.respond_to?(:date_squared)
  end

  def test_encryption_squared
    date = DateGenerator.new
    assert_equal 925072225, date.date_squared("30415")
  end

  def test_different_encryption_squared
    date = DateGenerator.new
    assert_equal 412699225, date.date_squared("20315")
  end

  def test_it_responds_to_date_splitter
    date = DateGenerator.new
    assert date.respond_to?(:date_splitter)
  end

  def test_date_squared_is_to_4_digit_array
    date = DateGenerator.new
    assert_equal [9, 2, 2, 5], date.date_splitter(412699225)
  end

  def test_different_date_squared_is_to_4_digit_array
    date = DateGenerator.new
    assert_equal [2, 2, 2, 5], date.date_splitter(925072225)
  end

  def test_date_code_returns_4_digit_array
    date = DateGenerator.new
    assert_equal 4, date.date_code_generator.length
    assert_equal Array, date.date_code_generator.class
  end
end
