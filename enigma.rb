require 'pry'

class Enigma
  attr_accessor :encryption

  def char_map
    [*('a'..'z'), *(0..9), ' ', '.', ',']
  end

  def encryption
    encryptor = []
    5.times{ encryptor << rand(0..9)}
    rotation(encryptor.join)
    encryptor.join
  end

  def rotation(encryption_key)
    rotations = {}
    rotators = [:a, :b, :c, :d]
    rotators.each_with_index do|item,index|
      rotations[item] = encryption_key[index..index + 1].to_i
    end
    rotations
  end

  def date_converter(date)
   date = Time.new
   date = date.strftime("%m%d%y")
   if date[0] == "0"
     date = date[1..5]
   end
   date_squared(date)
   date
  end

  def date_squared(date)
    date = date.to_i
    date = date ** 2
    date_splitter(date)
    date
  end

  def date_splitter(date)
    date = date.to_s.split("")
    date.map!{|e| e.to_i}
    date = date[-4..-1]
    offset_generator(date)
    date
  end

  def offset_generator(date)
    offsets = {}
    offsetters = [:a, :b, :c, :d]
    offsetters.each_with_index do|item,index|
      offsets[item] = date[index]
    end
    offsets
  end

  end


  enigma = Enigma.new
  enigma.encryption
