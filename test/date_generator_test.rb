require_relative 'test_helper'
require_relative '../lib/date_generator'

class DateGeneratorTest < Minitest::Test

  def test_it_exists
   assert DateGenerator.new
  end

  def test_date_generator_is_initialized_with_default_array
    date = DateGenerator.new
    assert_equal Array, date.date.class
  end

  def test_date_generator_is_initialized_with_6_digit_array
    date = DateGenerator.new
    assert_equal 6, date.date.length
  end

  def test_it_responds_to_date_creator
    date = DateGenerator.new
    assert date.respond_to?(:creator)
  end

  def test_date_creator_creates_an_string
    date = DateGenerator.new
    assert_equal String, date.creator.class
  end

  def test_date_creator_creates_a_6_digit_date
    date = DateGenerator.new
    assert_equal 6, date.creator.length
  end

  def test_it_responds_to_date_squared
    date = DateGenerator.new
    assert date.respond_to?(:square_number)
  end

  def test_date_squared_returns_squared_date
    date = DateGenerator.new('030415')
    assert_equal 925072225, date.square_number
    date2 = DateGenerator.new('020315')
    assert_equal 412699225, date2.square_number
  end

  def test_date_squared_returns_fixnum
    date = DateGenerator.new('030415')
    assert_equal Fixnum, date.square_number.class

  end
  def test_it_responds_to_date_splitter
    date = DateGenerator.new('030415')
    assert date.respond_to?(:split_number)
  end

  def test_date_squared_is_to_4_digit_array
    date = DateGenerator.new
    assert_equal [9, 2, 2, 5], date.split_number(412699225)
    assert_equal [2, 2, 2, 5], date.split_number(925072225)
  end

  def test_date_code_returns_4_digit_array
    date = DateGenerator.new
    assert_equal 4, date.split_number(412699225).length
    assert_equal Array, date.split_number(412699225).class
  end

  def test_key_generator_generates_correct_array
    date = DateGenerator.new('030415')
    assert_equal [2, 2, 2, 5], date.key_generator
  end
end
