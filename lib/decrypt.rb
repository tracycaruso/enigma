require_relative 'key_generator'
require_relative 'date_generator'
require_relative 'rotator'
require_relative 'enigma'

class Decrypt
  attr_reader :target_filename, :key, :date, :enigma, :decrypted_message

  def initialize(message_filename, target_filename, key, date)
    @message_filename  = message_filename
    @target_filename   = target_filename
    @key               = key
    @date              = date
    message            = File.open(@message_filename, "r"){ |file| file.read }.chomp.to_s
    rotator            = Rotator.new(key.to_i, date.to_i)
    @enigma            = Enigma.new(message, rotator)
  end

  def decrypt_message
    @decrypted_message = enigma.decrypt
  end

  def write_file
    File.open(target_filename, "w"){ |file| file.puts decrypted_message}
  end

  def success_message
    "Created '#{target_filename}' with the key #{key} and date #{date_check}"
  end

  private
  def date_check
    date < 100000 ? date.to_s.rjust(6,"0") : date
  end
end


if __FILE__ == $0
  decrypt = Decrypt.new(ARGV[0], ARGV[1], ARGV[2], ARGV[3])
  decrypt.decrypt_message
  decrypt.write_file
  puts decrypt.success_message
end
