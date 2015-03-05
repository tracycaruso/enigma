class RotationCalculator

  def initialize(encryption_key)
  end

  def rotation(encryption_key)
    rotations = {}
    rotators = [:a, :b, :c, :d]
    rotators.each_with_index do|item,index|
      rotations[item] = encryption_key[index..index + 1].to_i
    end
    rotations
  end

end
