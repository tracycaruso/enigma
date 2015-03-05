class KeyGenerator

  def encryption_generator
    encryptor = []
    5.times{ encryptor << rand(0..9)}
    encryptor.join
  end


end
