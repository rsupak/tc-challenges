require './lib/fold_array.rb'

RSpec.describe '#Folding Tests' do
  let(:basic) { [1, 2, 3, 4, 5] }
  let(:complex) { [-9, 9, -8, 8, 66, 23] }

  it 'Basic Tests 1 fold' do
    expect(fold_array(basic, 1)).to eq([6, 6, 3])
  end

  it 'Basic Tests 2 folds' do
    expect(fold_array(basic, 2)).to eq([9, 6])
  end

  it 'Basic Tests 3 folds' do
    expect(fold_array(basic, 3)).to eq([15])
  end

  it 'Basic Tests folds array with negative numbers' do
    expect(fold_array(complex, 1)).to eq([14, 75, 0])
  end
end
