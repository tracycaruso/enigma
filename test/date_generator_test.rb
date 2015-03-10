require_relative 'test_helper'
require_relative '../lib/date_generator'

class DateGeneratorTest < Minitest::Test
  def test_it_exists
    assert DateGenerator.new
  end

  def test_it_responds_to_date_generator
    date_generator = DateGenerator.new
    assert date_generator.respond_to?(:generate_date)
  end

  def test_it_generates_a_date_as_MMDDYY
    date_generator = DateGenerator.new
    date = date_generator.generate_date #=> 030115

    assert_instance_of Fixnum, date
    assert date.to_s.length == 5 || date.to_s.length == 6
  end

  def test_it_generates_the_same_date_on_the_same_day
    date_generator = DateGenerator.new
    date_generator2 = DateGenerator.new
    date1 = date_generator.generate_date
    date2 = date_generator.generate_date
    assert_same date1, date2
  end
end
