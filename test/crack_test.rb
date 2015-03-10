# require_relative 'test_helper'
# require_relative '../lib/crack'
#
# class CrackTest < Minitest::Test
#   def test_it_exists
#     assert Crack.new('encrypted.txt', 'cracked.txt', 030415)
#   end
#
#   def test_crack_returns_a_number
#     crack = Crack.new('encrypted.txt', 'cracked.txt', 030415)
#     decrypted_message[-4..-1] == "nd.."
#     assert_instance_of Fixnum, crack.crack
#   end
#
#   def test_it_responds_to_write_file
#     crack = Crack.new('encrypted.txt', 'cracked.txt', 030415)
#     assert crack.respond_to?(:write_file)
#   end
#
#   def test_write_file_includes_a_file
#     crack = Crack.new('encrypted.txt', 'cracked.txt', 030415)
#     assert_instance_of NilClass, crack.write_file
#   end
#
#   def test_success_message_returns_a_string
#     crack = Crack.new('encrypted.txt', 'cracked.txt', 030415)
#     assert_instance_of String, crack.success_message
#   end
# end
