require_relative 'key_generator'
require_relative 'date_generator'
require_relative 'rotator'
require_relative 'cipher'
require_relative 'messages'

class Encrypt
  attr_reader :output_messages, :message_file, :target_file, :key, :date, :cipher, :encrypted_message

  def initialize(message_file, target_file)
    @output_messages   = Messages.new
    @message_file      = message_file
    @target_file       = target_file
    @key               = KeyGenerator.new.generate_key
    @date              = DateGenerator.new.generate_date
    rotator            = Rotator.new(key, date)
    message            = File.open(message_file, "r"){ |file| file.read }.chomp.to_s
    @cipher            = Cipher.new(message, rotator)
  end

  def encrypt_message
    @encrypted_message = cipher.encrypt
  end

  def write_file
    File.open(target_file, "w"){ |file| file.puts encrypted_message}
  end

  def success_message
    output_messages.success(target_file, key, date)
  end
end


if __FILE__ == $0
  encrypt = Encrypt.new(ARGV[0], ARGV[1])
  encrypt.encrypt_message
  encrypt.write_file
  puts  encrypt.success_message
end
