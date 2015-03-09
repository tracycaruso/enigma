class OffsetCalculator
  attr_reader :date

  def initialize(date)
    @date = date
  end
  
  def offsets
    offsetters = [:a, :b, :c, :d]
    offsetters.each_with_object({}).with_index do |(offset, hash), index|
      hash[offset] = offset_generator[index]
    end
  end

  def offset_generator
    squared_date = date ** 2
    squared_date.to_s.chars.last(4).map(&:to_i)
  end
end
