class KeyGenerator
  def generate_key
    rand(0..9.0).to_s.slice(2..6)
  end
end
