#!/usr/bin/env ruby
require_relative 'key_generator'
require_relative 'date_generator'
require_relative 'rotator'
require_relative 'enigma'

class Encrypt
  attr_reader :message_filename, :target_filename, :key, :date, :encrypted_message
  def initialize
    @message_filename  = ARGV[0]
    @target_filename   = ARGV[1]
    message            = File.open(message_filename, "r"){ |file| file.read }.chomp.to_s
    @key               = KeyGenerator.new.generate_key
    @date              = DateGenerator.new.generate_date
    rotator            = Rotator.new(key.to_i, date.to_i)
    enigma             = Enigma.new(message, rotator)
    @encrypted_message = enigma.encrypt
  end

  def write_file
    File.open(target_filename, "w"){ |file| file.puts encrypted_message}
    puts "Created '#{message_filename}' with the key #{key} and date #{date}"
  end
end
encrypt = Encrypt.new
encrypt.write_file
