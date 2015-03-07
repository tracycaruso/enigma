class DateGenerator

  def date_code_generator
    date_splitter(date_squared(date_converter))
  end


  def date_converter
   date = Time.new.strftime("%m%d%y")
   date.slice(1..5) if date.start_with?("0")
  end

  def date_squared(date)
    date.to_i ** 2
  end

  def date_splitter(date)
    date = date.to_s.split("").map!{|e| e.to_i}
    date.last(4)
  end

end
