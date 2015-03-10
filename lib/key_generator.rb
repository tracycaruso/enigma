class KeyGenerator
  def generate_key
    rand(0..9.0).to_s.slice(3..7)
  end
end
