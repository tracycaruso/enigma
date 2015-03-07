require_relative './key_generator'
require_relative './rotation_calculator'
require_relative './date_generator'
require_relative './offset_calculator'
class Rotator

  def initialize
    secret_key      =   KeyGenerator.new
    rotation_calc   =   RotationCalculator.new
    date            =   DateGenerator.new
    offset_calc     =   OffsetCalculator.new

    @rotations      =   rotation_calc.rotation("41521")#secret_key.encryption_generator)
    @offsets        =   offset_calc.offset_generator( [9, 2, 2, 5])#date.date_code_generator)

  end


  def total_rotation_values
    @total_rotation = @rotations.merge(@offsets) do |key, rot_value, off_value|
      rot_value + off_value
    end
  end

end
