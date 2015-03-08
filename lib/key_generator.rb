class KeyGenerator
  attr_reader :key

  def initialize(key = encryption_generator)
    @key = key
  end

  def encryption_generator
    rand(0..9.0).to_s.slice(2..6)
  end

end
