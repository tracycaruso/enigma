class OffsetCalculator

  def offset_generator(date)
    offsets     = {}
    offsetters  = [:a, :b, :c, :d]
    offsetters.each_with_index do |offset, index|
      offsets[offset] = date[index]
    end
    offsets
  end

end
