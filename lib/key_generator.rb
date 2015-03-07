class KeyGenerator

  def initialize(key = nil)
    @key = key
  end


  def encryption_generator
    (1..5).map{ |n| n = rand(0..9)}
    # @key = encryptor.join if !@key
  end



end
