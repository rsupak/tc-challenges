require_relative '../lib/interpreter'

RSpec.describe '#interpreter' do
  it 'echo until byte(255) encountered' do
    expect(brain_luck(',+[-.,+]', 'Codewars' + 255.chr)).to eq('Codewars')
  end

  it 'echo until byte(0) encountered' do
    expect(brain_luck(',[.[-],]', 'Codewars' + 0.chr)).to eq('Codewars')
  end

  it 'two numbers multiplier' do
    expect(brain_luck(',>,<[>[->+>+<<]>>[-<<+>>]<<<-]>>.', 8.chr + 9.chr)).to eq(72.chr)
  end
end
