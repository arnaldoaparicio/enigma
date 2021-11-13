class Enigma
  attr_reader :alphabet, :key, :date

  def initialize
    @alphabet = ('a'..'z').to_a << ' '
    @key = key
    @date = date
  end

  # def todays_date
  #   @offset = Date.today.strftime('%d%m%y')
  # end

  def generate_key(key)
    list = []
    a = key[0..1]
    b = key[1..2]
    c = key[2..3]
    d = key[3..4]
    list << a << b << c << d
    list.map(&:to_i)
  end

  def generate_offset(date)
    list = []
    numeric = date.to_i**2
    a = numeric.to_s[-4]
    b = numeric.to_s[-3]
    c = numeric.to_s[-2]
    d = numeric.to_s[-1]
    list << a << b << c << d
    list.map(&:to_i)
  end

  def addition(key, date)
    @key = generate_key(key)
    @date = generate_offset(date)
    @key.zip(@date).map {|x, y| x + y}
  end

  def encrypt(message, key = nil, date = nil)
    e =  addition(key, date)
    mess = message.split("")
    mess.map do |m|
      
      # require "pry"; binding.pry
    # end



   end
end

#
#
# def decrypt(message, key, date)
# end
