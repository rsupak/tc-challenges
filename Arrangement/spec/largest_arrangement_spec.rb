require_relative 'largest_arrangement'

describe 'largest_arrangement' do
  
  # tests if method will return largest number combination
  it 'returns the greatest value from the combine numbers of the array' do
    expect(largest_arrangement([4, 50, 8, 145])).to eq(8_504_145)
    expect(largest_arrangement([4, 40, 7])).to eq(7440)
    expect(largest_arrangement([4, 46, 7])).to eq(7464)
    expect(largest_arrangement([5, 2, 1, 9, 50, 56])).to eq(95_655_021)
  end

  # tests how method handles an empty array
  it 'handles an empty array' do
    expect(largest_arrangement([])).to eq('Empty Array')
  end

  # tests how method handles an array of 1 item
  it 'handles an array of length one' do
    expect(largest_arrangement([6])).to eq(6)
  end

  # tests how method handles invalid numbers
  it 'handles an negative number in the array' do
    expect(largest_arrangement([2, 3, 1, 9, -50])).to eq('Only positive numbers are accepted')
  end
end
