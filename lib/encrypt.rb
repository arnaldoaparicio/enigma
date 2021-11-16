require './enigma'
require 'date'

enigma = Enigma.new
new_file = File.open(ARGV[0], 'r')


encrypt_file = new_file.read
new_file.close

encrypted_message = enigma.encrypt(encrypt_file.strip)

writer = File.open(ARGV[1], "w")
writer.write(encrypted_message[:encryption])
writer.close

p "Created 'encrypted.txt' with the key #{encrypted_message[:key]}, and date #{encrypted_message[:date]}"
