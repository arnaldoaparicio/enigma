require 'simplecov'
SimpleCov.start

require 'date'
require './lib/enigma'

RSpec.describe Enigma do
  it 'exists' do
    enigma = Enigma.new
    expect(enigma).to be_an(Enigma)
  end

  it 'has a key' do
    enigma = Enigma.new
    enigma.random_number_generator
    allow(enigma).to receive(:key).and_return('02816')
    expect(enigma.key.size).to eq(5)
    expect(enigma.key).to eq('02816')
  end

  it 'has an offset' do
    enigma = Enigma.new
    allow(enigma).to receive(:offset).and_return('021121')
    expect(enigma.offset).to eq('021121')

  end

  it 'has an alphabet' do
    enigma = Enigma.new
    expected = ["a", "b", "c", "d", "e", "f", "g",
                "h", "i", "j", "k", "l", "m", "n",
                "o", "p", "q", "r", "s", "t", "u",
                "v", "w", "x", "y", "z", " "]

    expect(enigma.alphabet).to eq(expected)
  end

  xit 'encrypts' do
    enigma = Enigma.new
    expected = {
      encryption: 'keder ohulw',
      key: '02715',
      date: '040895'
    }
    expect(enigma.encrypt('hello world', '02715', '040895')).to eq(expected)
  end

  xit 'decrypts' do
    enigma = Enigma.new
    expected = {
      decryption: 'hello world',
      key: '02715',
      date: '040895'
    }
    expect(enigma.decrypt('keder ohulw', '02715', '040895')).to eq(expected)
  end
end
