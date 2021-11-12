class Enigma
attr_reader :alphabet, :key, :offset
def initialize
  @alphabet = ("a".."z").to_a << " "
  @key = key
  @offset = Date.today.strftime("%d%m%y")


end

def random_number_generator
  @key = 5.times.map {rand(0..9)}.join
end


# def encrypt(message, key, date)
# end
#
#
# def decrypt(message, key, date)
# end
end
