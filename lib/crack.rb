require_relative 'rotator'
require_relative 'cipher'
require_relative 'messages'

class Crack
  attr_reader :output_messages, :target_file, :date, :message_file, :modified_message, :key

  def initialize(message_file, target_file, date)
    @output_messages   =  Messages.new
    @target_file       =  target_file
    @date              =  date
    @message_file      =  message_file
    @modified_message  =  ""
    @key               =  0
  end

  def crack_file
    until confirmed_decrypted?
      rotator            =  Rotator.new(@key, date)
      cipher             =  Cipher.new(read_file, rotator)
      @modified_message  =  cipher.decrypt
      @key += 1
    end
  end

  def write_file
    File.open(target_file, "w"){ |file| file.puts modified_message}
  end

  def success_message
    output_messages.success(target_file, key-1, date)
  end

  private
  def confirmed_decrypted?
    matching_phrase   =  "..end.."
    modified_message[-7..-1] == matching_phrase
  end

  def read_file
    File.open(message_file, "r"){ |file| file.read }.chomp.to_s
  end

end

if __FILE__ == $0
  crack = Crack.new(ARGV[0], ARGV[1], ARGV[2])
  crack.crack_file
  crack.write_file
  puts crack.success_message
end
