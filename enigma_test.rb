require 'minitest/autorun'
require 'minitest/pride'
require './enigma'

class EnigmaTest < Minitest::Test
#assert centaur.respond_to?(:lay_down)
  def test_it_exists
   assert EnigmaTest
  end

  def test_enigma_exists
   enigma = Enigma.new
  end

  def test_character_map_is_an_array
   enigma = Enigma.new
   assert_equal Array, enigma.char_map.class
  end

  def test_encryption_is_5_characters_long
    enigma = Enigma.new
    assert_equal 5, enigma.encryption.length
  end

  def test_creates_different_encryption_key
    enigma1 = Enigma.new
    enigma2 = Enigma.new
    refute_equal enigma1.encryption, enigma2.encryption
  end

  def test_rotation_returns_a_hash
    enigma = Enigma.new
    assert_equal Hash, enigma.rotation('12345').class
  end

  def test_rotation_returns_rotation_keys
    enigma = Enigma.new
    result =  {:a=>12, :b=>23, :c=>34, :d=>45}
    assert_equal result, enigma.rotation('12345')
  end

  def test_rotation_returns_different_rotation_keys
    enigma = Enigma.new
    result =  {:a=>98, :b=>87, :c=>76, :d=>65}
    assert_equal result, enigma.rotation('98765')
  end

  def test_a_rotatation_is_equal_to_index_0_and_1_of_encryption
    enigma = Enigma.new
    assert_equal 12, enigma.rotation('12345')[:a]
    assert_equal 98, enigma.rotation('98765')[:a]
    assert_equal 56, enigma.rotation('56789')[:a]
  end

  def test_b_rotatation_is_equal_to_index_1_and_2_of_encryption
    enigma = Enigma.new
    assert_equal 23, enigma.rotation('12345')[:b]
    assert_equal 87, enigma.rotation('98765')[:b]
    assert_equal 67, enigma.rotation('56789')[:b]
  end

  def test_c_rotatation_is_equal_to_index_2_and_3_of_encryption
    enigma = Enigma.new
    assert_equal 34, enigma.rotation('12345')[:c]
    assert_equal 76, enigma.rotation('98765')[:c]
    assert_equal 78, enigma.rotation('56789')[:c]
  end

  def test_d_rotatation_is_equal_to_index_3_and_4_of_encryption
    enigma = Enigma.new
    assert_equal 45, enigma.rotation('12345')[:d]
    assert_equal 65, enigma.rotation('98765')[:d]
    assert_equal 89, enigma.rotation('56789')[:d]
  end

  def test_date_equals_today
    enigma = Enigma.new
    assert_equal "30415", enigma.date_converter("030415")
  end
  #
  # def test_date_equals_today
  #   enigma = Enigma.new
  #   assert_equal "20315", enigma.date_converter("020315")
  # end

  def test_encryption_squared
    enigma = Enigma.new
    assert_equal 925072225, enigma.date_squared("30415")
  end

  def test_different_encryption_squared
    enigma = Enigma.new
    assert_equal 412699225, enigma.date_squared("20315")
  end

  def test_date_squared_is_to_4_digit_array
    enigma = Enigma.new
    assert_equal [9, 2, 2, 5], enigma.date_splitter(412699225)
  end

  def test_different_date_squared_is_to_4_digit_array
    enigma = Enigma.new
    assert_equal [2, 2, 2, 5], enigma.date_splitter(925072225)
  end


  def test_offset_generator_returns_offest_keys
    enigma = Enigma.new
    result =  {:a=>9, :b=>2, :c=>2, :d=>5}
    assert_equal result, enigma.offset_generator([9,2,2,5])
  end

  def test_different_offset_generator_returns_offest_keys
    enigma = Enigma.new
    result =  {:a=>2, :b=>2, :c=>2, :d=>5}
    assert_equal result, enigma.offset_generator([2,2,2,5])
  end

  def test_offset_a_equals_0_index_in_array
    enigma = Enigma.new
    assert_equal 9, enigma.offset_generator([9,2,2,5])[:a]
    assert_equal 8, enigma.offset_generator([8,1,4,8])[:a]
    assert_equal 5, enigma.offset_generator([5,3,1,2])[:a]
  end

  def test_offset_b_equals_1_index_in_array
    enigma = Enigma.new
    assert_equal 2, enigma.offset_generator([9,2,2,5])[:b]
    assert_equal 1, enigma.offset_generator([8,1,4,8])[:b]
    assert_equal 3, enigma.offset_generator([5,3,1,2])[:b]

  end


  def test_offset_c_equals_2_index_in_array
    enigma = Enigma.new
    assert_equal 2, enigma.offset_generator([9,2,2,5])[:c]
    assert_equal 4, enigma.offset_generator([8,1,4,8])[:c]
    assert_equal 1, enigma.offset_generator([5,3,1,2])[:c]

  end


  def test_offset_d_equals_3_index_in_array
    enigma = Enigma.new
    assert_equal 5, enigma.offset_generator([9,2,2,5])[:d]
    assert_equal 8, enigma.offset_generator([8,1,4,8])[:d]
    assert_equal 2, enigma.offset_generator([5,3,1,2])[:d]
  end






end
