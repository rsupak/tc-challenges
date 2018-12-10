include RSpec
require_relative 'consecutive_strings'

describe '#longest_consec' do
  let(:array1) { %w[zone abigail theta form libe zas] }
  let(:array2) { %w[] }
  let(:array3) { %w[itvayloxrp wkppqsztdkmvcuwvereiupccauycnjutlv vweqilsfytihvrzlaodfixoyxvyuyvgpck] }
  let(:array4) { %w[it wkppv ixoyx 3452 zzzzzzzzzzzz] }
  let(:array5) { %w[wlwsasphmxx owiaxujylentrklctozmymu wpgozvxxiu] }
  let(:array6) { %w[ejjjjmmtthh zxxuueeg aanlljrrrxx dqqqaaabbb oocccffuucccjjjkkkjyyyeehh] }

  it 'finds the longest consecutive string from a string array' do
    expect(longest_consec(array1, 2)).to eq('abigailtheta')
  end

  it 'handles an empty array' do
    expect(longest_consec(array2, 3)).to eq('')
  end

  it 'handles large strings in the array' do
    expect(longest_consec(array3, 2)).to eq('wkppqsztdkmvcuwvereiupccauycnjutlvvweqilsfytihvrzlaodfixoyxvyuyvgpck')
  end

  it 'handles strings that contain numbers' do
    expect(longest_consec(array4, 3)).to eq('ixoyx3452zzzzzzzzzzzz')
  end

  it 'handles positive slice arguments' do
    expect(longest_consec(array5, 2)).to eq('wlwsasphmxxowiaxujylentrklctozmymu')
  end

  it 'handles a negative slice argument' do
    expect(longest_consec(array1, -2)).to eq('')
  end

  it 'handles slice arguments of one' do
    expect(longest_consec(array6, 1)).to eq('oocccffuucccjjjkkkjyyyeehh')
  end

  it 'handles slice arguments larger than array.size' do
    expect(longest_consec(array4, 15)).to eq('')
  end

  it 'handles slice arguments of zero' do
    expect(longest_consec(array4, 0)).to eq('')
  end
end
