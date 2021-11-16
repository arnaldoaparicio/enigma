class Enigma
  attr_reader :alphabet, :keys, :dates, :random

  def initialize
    @alphabet = ('a'..'z').to_a << ' '
    @keys = keys
    @dates = dates
    @random = []
  end

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
    @keys = generate_key(key)
    @dates = generate_offset(date)
    @keys.zip(@dates).map { |x, y| x + y }
  end

  def encrypt(message, key = nil, date = nil)
    if date == nil
      date = Date.today.strftime('%d%m%y')
    end
    if key == nil
      @random << 5.times.map {rand(0..9)}.join
      key = @random.join
    end

    encryption_hash = {}
    all_encrypted = []
    all_keys = addition(key, date)

    given_message = message.downcase.split('')
    given_message.each_with_index do |value, index|
      if index % 4 == 0
        a_shift = @alphabet.index(value) + all_keys[0]
        all_encrypted << @alphabet[a_shift % 27]
      elsif index % 4 == 1
        b_shift = @alphabet.index(value) + all_keys[1]
        all_encrypted << @alphabet[b_shift % 27]
      elsif index % 4 == 2
        c_shift = @alphabet.index(value) + all_keys[2]
        all_encrypted << alphabet[c_shift % 27]
      elsif index % 4 == 3
        d_shift = @alphabet.index(value) + all_keys[3]
        all_encrypted << alphabet[d_shift % 27]
      end
    end
    encrypt = all_encrypted.join
    encryption_hash.merge!(encryption: encrypt, key: key, date: date)
  end

  def decrypt(message, key = nil, date = nil)
    decryption_hash = {}
    all_decrypted = []

    all_keys = addition(key, date)
    if date == nil
      date = Date.today.strftime('%d%m%y')
    end

    given_message = message.downcase.split('')
    given_message.each_with_index do |value, index|
      if index % 4 == 0
        a_shift = @alphabet.index(value) - all_keys[0]
        all_decrypted << @alphabet[a_shift % 27]
      elsif index % 4 == 1
        b_shift = @alphabet.index(value) - all_keys[1]
        all_decrypted << @alphabet[b_shift % 27]
      elsif index % 4 == 2
        c_shift = @alphabet.index(value) - all_keys[2]
        all_decrypted << @alphabet[c_shift % 27]
      elsif index % 4 == 3
        d_shift = @alphabet.index(value) - all_keys[3]
        all_decrypted << @alphabet[d_shift % 27]
      end
    end
    decrypt = all_decrypted.join
    decryption_hash.merge!(decryption: decrypt, key: key, date: date)
  end
end
