require_relative 'key_generator'
require_relative 'date_generator'
require_relative 'rotator'
require_relative 'enigma'

class Encrypt
  attr_reader :message_filename, :target_filename, :key, :date, :enigma, :encrypted_message

  def initialize(message_filename, target_filename)
    @message_filename  = message_filename
    @target_filename   = target_filename
    message            = File.open(message_filename, "r"){ |file| file.read }.chomp.to_s
    @key               = KeyGenerator.new.generate_key
    @date              = DateGenerator.new.generate_date
    rotator            = Rotator.new(key.to_i, date.to_i)
    @enigma            = Enigma.new(message, rotator)
  end

  def encrypt_message
    @encrypted_message = enigma.encrypt
  end

  def write_file
    File.open(target_filename, "w"){ |file| file.puts encrypted_message}
  end

  def success_message
    "Created '#{message_filename}' with the key #{key} and date #{date_check}"
  end

  private
  def date_check
    date < 100000 ? date.to_s.rjust(6,"0") : date
  end
end


if __FILE__ == $0
  encrypt = Encrypt.new(ARGV[0], ARGV[1])
  encrypt.encrypt_message
  encrypt.write_file
  puts  encrypt.success_message
end
