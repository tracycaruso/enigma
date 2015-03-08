# ./lib/encrypt.rb message.txt encrypted.txt

# get the command line args

# read the file

# pass the message into Enimga.encrypt()
key = KeyGenerator.new_key
date = DateGenerator.new_date
rotator = Rotator.new(key, date)

enigma = Enigma.new(message, rotator)

encrypted_message = enigma.encrypt

# save the result to a file

# print results to the console
