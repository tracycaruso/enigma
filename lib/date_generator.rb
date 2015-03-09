class DateGenerator
  # Is it reasonable to have this logic elsewhere?
  # For example combining this with the KeyGenerator
  def generate_date
    Time.new.strftime("%m%d%y").to_i
  end
end
