require './lib/snail_sort.rb'

RSpec.describe '#snail_sort' do
  it 'checks for values in the all input arrays' do
    expect(snail_sort([[], [], []]))
      .to eq('there are no digits in the input arrays')
  end

  it 'checks that all input arrays are the same size' do
    expect(snail_sort([[1, 2, 3], [5, 6], [8]]))
      .to eq('the number inputs in each input array must be the same')
  end

  it 'sorts 3x3 matrix' do
    expect(snail_sort([[1, 2, 3], [4, 5, 6], [7, 8, 9]]))
      .to eq([1, 2, 3, 6, 9, 8, 7, 4, 5])
  end

  it 'sorts a 4x4 matrix' do
    expect(snail_sort([[1, 2, 3, 1], [4, 5, 6, 4], [7, 8, 9, 7], [7, 8, 9, 7]]))
      .to eq([1, 2, 3, 1, 4, 7, 7, 9, 8, 7, 7, 4, 5, 6, 9, 8])
  end
end
