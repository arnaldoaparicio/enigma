require 'simplecov'
SimpleCov.start

require 'date'
require './lib/enigma'

RSpec.describe Enigma do
  it 'exists' do
    enigma = Enigma.new
    expect(enigma).to be_an(Enigma)
  end

  it 'has an alphabet' do
    enigma = Enigma.new
    expected = ['a', 'b', 'c', 'd', 'e', 'f', 'g',
                'h', 'i', 'j', 'k', 'l', 'm', 'n',
                'o', 'p', 'q', 'r', 's', 't', 'u',
                'v', 'w', 'x', 'y', 'z', ' ']

    expect(enigma.alphabet).to eq(expected)
  end

  it 'has a key' do
    enigma = Enigma.new
    allow(enigma).to receive(:keys).and_return(['02715'])
    expect(enigma.keys).to eq(['02715'])
    expect(enigma.keys[0].length).to eq(5)
  end

  it 'has an offset' do
    enigma = Enigma.new
    allow(enigma).to receive(:dates).and_return(['021121'])
    expect(enigma.dates).to eq(['021121'])
    expect(enigma.dates[0].length).to eq(6)
  end

  it 'generates key' do
    enigma = Enigma.new
    expect(enigma.generate_key('02715')).to eq([0o2, 27, 71, 15])
  end

  it 'generates offset' do
    enigma = Enigma.new
    expect(enigma.generate_offset('040895')).to eq([1, 0, 2, 5])
  end

  it 'adds the offset and keys' do
    enigma = Enigma.new
    expect(enigma.addition('02715', '040895')).to eq([3, 27, 73, 20])
    expect(enigma.dates).to eq([1, 0, 2, 5])
    expect(enigma.keys).to eq([0o2, 27, 71, 15])
  end

  it 'encrypts' do
    enigma = Enigma.new

    expected = {
      encryption: 'keder ohulw',
      key: '02715',
      date: '040895'
    }
    expect(enigma.encrypt('hello world', '02715', '040895')).to eq(expected)
    expect(enigma.keys).to eq([2, 27, 71, 15])
    expect(enigma.dates).to eq([1, 0, 2, 5])
    expect(enigma.random).to eq([])
  end

  it 'encrypts with uppercase message' do
    enigma = Enigma.new

    expected = {
      encryption: 'keder ohulw',
      key: '02715',
      date: '040895'
    }
    expect(enigma.encrypt('HELLO WORLD', '02715', '040895')).to eq(expected)
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

  it 'encrypts with special key' do
    enigma = Enigma.new

    expected = {
      encryption: 'keder ohulw!',
      key: '02715',
      date: '040895'
    }
    expect(enigma.encrypt('hello world!', '02715', '040895')).to eq(expected)
  end

  it 'decrypts with special key' do
    enigma = Enigma.new

    expected = {
      decryption: 'hello world!',
      key: '02715',
      date: '040895'
    }
    expect(enigma.decrypt('keder ohulw!', '02715', '040895')).to eq(expected)
  end
end
