require 'simplecov'
SimpleCov.start

require 'date'
require './lib/enigma'

RSpec.describe Enigma do
  it 'exists' do
    enigma = Enigma.new
    expect(enigma).to be_an(Enigma)
  end

  it 'encrypts do' do
    enigma = Enigma.new
    expected = {
      encryption: 'keder ohulw',
      key: '02715',
      date: '040895'
    }
    expect(enigma.encrypt('hello world', '02715', '040895')).to eq(expected)
  end

  it 'decrypts' do
    enigma = Enigma.new
    expected = {
      decryption: 'hello world',
      key: '02715',
      date: '040895'
    }
    expect(enigma.decrypt('keder ohulw', '02715', '040895')).to eq(expected)
  end
end
