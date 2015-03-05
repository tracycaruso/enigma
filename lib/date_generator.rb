class DateGenerator

  def date_converter(date)
   date = Time.new
   date = date.strftime("%m%d%y")
   if date[0] == "0"
     date = date[1..5]
   end
   date
  end

  def date_squared(date)
    date = date.to_i
    date = date ** 2
  end

  def date_splitter(date)
    date = date.to_s.split("")
    date.map!{|e| e.to_i}
    date = date[-4..-1]
  end

end
