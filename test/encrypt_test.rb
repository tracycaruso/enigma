require_relative 'test_helper'
require_relative '../lib/encrypt'

class EncryptTest < Minitest::Test
  def test_it_exists
    assert Encrypt.new('message.txt', 'encrypted.txt')
  end

  

end
