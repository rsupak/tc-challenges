require_relative '../lib/josephus'

RSpec.describe "#josephus" do
  it 'returns the array when skip is 1' do
    expect(josephus([1, 2, 3, 4, 5, 6, 7, 8, 9, 10], 1)).to eq [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
  end

  it 'correctly skips indices when skip is even' do
    expect(josephus([1, 2, 3, 4, 5, 6, 7, 8, 9, 10], 2)).to eq [2, 4, 6, 8, 10, 3, 7, 1, 9, 5]
  end

  it 'correctly skips indices when skip is odd' do
    expect(josephus([1, 2, 3, 4, 5, 6, 7], 3)).to eq [3, 6, 2, 7, 5, 1, 4]
  end

  it 'correctly skips indices when elements are characters' do
    expect(josephus(%w[C o d e W a r s], 4)).to eq %w[e s W o C d r a]
  end

  it 'correctly handles an empty array' do
    expect(josephus([], 3)).to eq []
  end

  it 'correctly handles an array of length 1' do
    expect(josephus([1], 1)).to eq [1]
  end
end
