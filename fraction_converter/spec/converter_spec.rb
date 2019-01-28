require_relative '../lib/converter'

RSpec.describe '#mixed_fraction' do
  it 'converts improper fraction to mixed number' do
    expect(mixed_fraction('42/9')).to eq '4 2/3'
  end

  it 'converts improper fraction to whole number' do
    expect(mixed_fraction('6/3')).to eq '2'
  end

  it 'reduces fractions' do
    expect(mixed_fraction('4/6')).to eq '2/3'
  end

  it 'reduces fractions and handles negative number in the denominator' do
    expect(mixed_fraction('4/-6')).to eq '-2/3'
  end

  it 'reduces to 0 when numerator is 0 and denominator is not 0' do
    expect(mixed_fraction('0/18891')).to eq '0'
  end

  it 'converts fraction to mixed number with negative numerator' do
    expect(mixed_fraction('-10/7')).to start_with '-1 3/7'
  end

  it 'converts fraction to mixed number with negative denominator' do
    expect(mixed_fraction('10/-7')).to start_with '-1 3/7'
  end

  it 'converts fraction to positive number with negative numerator and denominator' do
    expect(mixed_fraction('-22/-7')).to eq '3 1/7'
  end

  it 'must raise ZeroDivisionError even with 0 in the numerator' do
    expect { mixed_fraction('0/0') }.to raise_error(ZeroDivisionError)
  end

  it 'must raise ZeroDivisionError' do
    expect { mixed_fraction('3/0') }.to raise_error(ZeroDivisionError)
  end
end
