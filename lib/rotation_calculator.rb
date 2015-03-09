class RotationCalculator
  def rotation(encryption_key)
    rotations   = {}
    rotators    = [:a, :b, :c, :d]
    rotators.each_with_index do |rot ,index|
      rotations[rot] = encryption_key[index..index + 1].to_i
    end
    rotations
  end
end
