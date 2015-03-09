require_relative 'key_generator'
require_relative 'date_generator'
require_relative 'rotator'
require_relative 'enigma'

class Decrypt
  attr_reader :target_filename, :key, :date, :decrypted_message
  def initialize
    message_filename   = ARGV[0]
    @target_filename   = ARGV[1]
    @key               = ARGV[2]
    @date              = ARGV[3]
    message            = File.open(message_filename, "r"){ |file| file.read }.chomp.to_s
    rotator            = Rotator.new(key.to_i, date.to_i)
    enigma             = Enigma.new(message, rotator)
    @decrypted_message = enigma.decrypt
  end

  def write_file
    File.open(target_filename, "w"){ |file| file.puts decrypted_message}
    puts "Created '#{target_filename}' with the key #{key} and date #{date}"
  end
end

decrypt = Decrypt.new
decrypt.write_file
