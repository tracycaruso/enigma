class DateGenerator

  attr_reader :date

  def initialize(date = creator)
    @date = date.chars
  end

  def creator
    date = Time.new.strftime("%m%d%y")
  end

  def square_number
    date.join.to_i ** 2
  end

  def split_number(date)
    date.to_s.chars.last(4).map(&:to_i)
  end

  def key_generator
    split_number(square_number)
  end

end
