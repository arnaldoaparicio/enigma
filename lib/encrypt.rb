require './enigma'
require 'date'

enigma = Enigma.new
new_file = File.open(ARGV[0], 'r')


encrypt_file = new_file.read
new_file.close

example = enigma.encrypt(encrypt_file.strip)

writer = File.open(ARGV[1], "w")
writer.write(example[:encryption])
writer.close

p "Created 'encrypted.txt' with the key #{example[:key]}, and date #{example[:date]}"
