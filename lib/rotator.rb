require_relative 'rotation_calculator'
require_relative 'offset_calculator'

class Rotator
  attr_reader :offsets, :rotations

  def initialize(key, date)
    @key       = key
    @date      = date
    @rotations = RotationCalculator.new.rotation(@key.to_s)
    @offsets   = OffsetCalculator.new(@date.to_i).offsets
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
