require_relative 'crack_generator'
require_relative 'date_generator'
require_relative 'rotator'
require_relative 'enigma'

class Cracker
  attr_reader :message_filename, :target_filename, :date, :message, :decrypted_message, :key
  def initialize
    @message_filename  = ARGV[0]
    @target_filename   = ARGV[1]
    @date              = ARGV[2]
    @message           = File.open(message_filename, "r"){ |file| file.read }.chomp.to_s
  end

  def crack
    @key = 0
    until @decrypted_message.to_s[-4..-1] == "nd.."
      rotator            = Rotator.new(@key.to_i, date.to_i)
      enigma             = Enigma.new(message, rotator)
      @decrypted_message = enigma.decrypt
      @key += 1
    end
  end

  def write_file
    File.open(target_filename, "w"){ |file| file.puts decrypted_message}
  end

  def success_message
    puts "Created '#{target_filename}' with the key #{key-1} and date #{date}"
  end
end

crack = Cracker.new
crack.crack
crack.write_file
crack.success_message
