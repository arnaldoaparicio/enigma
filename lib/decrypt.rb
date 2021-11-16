require './enigma'
require 'date'

enigma = Enigma.new
new_file = File.open(ARGV[0], 'r')

key = ARGV[2]
date = ARGV[3]

decrypt_file = new_file.read
new_file.close

example = enigma.decrypt(decrypt_file.strip, key, date)

writer = File.open(ARGV[1], "w")
writer.write(example[:decryption])
writer.close

p "Created 'decrypted.txt' with the key #{key}, and date #{date}"
