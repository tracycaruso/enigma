require_relative 'test_helper'
require_relative '../lib/date_generator'

class DateGeneratorTest < Minitest::Test
  def test_it_exists
    assert DateGenerator.new
  end

  def test_it_generates_a_date_as_MMDDYY
    date_generator = DateGenerator.new
    date = date_generator.generate_date #=> 030115

    assert_instance_of Fixnum, date
    assert date.to_s.length == 5 || date.to_s.length == 6
  end
end
