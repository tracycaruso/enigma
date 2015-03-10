class Messages
  def success(target_file, key, date)
    "Created '#{target_file}' with the key #{key} and date #{validate_date(date)}"
  end
  def validate_date(date)
    date.to_i < 100000 ? date.to_s.rjust(6,"0") : date
  end
end
