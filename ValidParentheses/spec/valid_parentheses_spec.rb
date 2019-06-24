require_relative '../lib/valid_parentheses'

RSpec.describe '#valid_parentheses?' do
  it 'correctly handles paired parentheses' do
    expect(valid_parentheses?('()')).to eq true
  end

  it 'correctly handles ")" as first character' do
    expect(valid_parentheses?(')(()))')).to eq false
  end

  it 'correctly handles input of length 1' do
    expect(valid_parentheses?('(')).to eq false
  end

  it 'correctly handles nested paired parentheses' do
    expect(valid_parentheses?('(())((()())())')).to eq true
  end

  it 'correctly handles an empty string' do
    expect(valid_parentheses?('')).to eq 'This is an empty string'
  end
end
