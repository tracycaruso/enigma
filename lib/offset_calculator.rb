class OffsetCalculator

  def offset_generator(date)
    offsets = {}
    offsetters = [:a, :b, :c, :d]
    offsetters.each_with_index do |item,index|
      offsets[item] = date[index]
    end
    offsets
  end

end
