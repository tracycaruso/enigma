require_relative './key_generator'
require_relative './rotation_calculator'
require_relative './date_generator'
require_relative './offset_calculator'
class Rotator

  attr_reader :total_rotation, :offsets, :rotations, :secret_key

  def initialize
    key_generator   =   KeyGenerator.new('41521')#if you dont pass a value it will generate todays date
    @secret_key     =   key_generator.key

    date            =   DateGenerator.new('020315') #if you dont pass a value it will generate random key
    date_key        =   date.date_generator


    rotation_calc   =   RotationCalculator.new
    offset_calc     =   OffsetCalculator.new


    @rotations      =   rotation_calc.rotation(@secret_key)
    @offsets        =   offset_calc.offset_generator(date.key_generator)#[9, 2, 2, 5])
  end

  def total_rotation_values
    rotations.merge(offsets) do |key, rot_value, off_value|
      rot_value + off_value
    end
  end

  def rotation_value(letter_position)
    total_rotation = total_rotation_values
    case
    when letter_position % 4 == 0 then total_rotation[:a]
    when letter_position % 4 == 1 then total_rotation[:b]
    when letter_position % 2 == 0 then total_rotation[:c]
    when letter_position % 2 == 1 then total_rotation[:d]
    end
  end

end

rotate = Rotator.new
