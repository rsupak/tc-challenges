require './lib/is_bst'

RSpec.describe '#bst?' do
  it 'correctly identifies example test cases' do
    expect(bst?(Node.new(5, Node.new(2, Node.new(1), Node.new(3)), Node.new(7, nil, Node.new(9))))).to be(true)
    expect(bst?(Node.new(7, Node.new(9), Node.new(2)))).to be(true)
    expect(bst?(Node.new(1, Node.new(2), Node.new(3)))).to be(false)
    expect(bst?(Node.new(5, Node.new(2, nil, Node.new(7)), Node.new(9)))).to be(false)
  end

  it 'handles an empty tree' do
    expect(bst?(nil)).to be(true)
  end

  it 'handles a trivial tree' do
    expect(bst?(Node.new(5))).to be(true)
  end

  it 'handles a 2-node tree' do
    expect(bst?(Node.new(5, Node.new(4)))).to be(true)
  end

  it 'correctly identifies list trees' do
    expect(bst?(Node.new(5, Node.new(4, Node.new(3, Node.new(2, Node.new(1, Node.new(-1, Node.new(-5000))))))))).to be(true)
    expect(bst?(Node.new(5, nil, Node.new(4, nil, Node.new(3, nil, Node.new(2, nil, Node.new(1, nil, Node.new(-1, nil, Node.new(-5000))))))))).to be(true)
    expect(bst?(Node.new(5, Node.new(4, Node.new(3, Node.new(2, Node.new(1, Node.new(7)))))))).to be(false)
    expect(bst?((Node.new(5, nil, Node.new(4, nil, Node.new(3, nil, Node.new(2, nil, Node.new(1, nil, Node.new(7))))))))).to be(false)
  end

  it 'handles edge cases' do
    expect(bst?(Node.new(50, Node.new(30, nil, Node.new(40, Node.new(20), Node.new(45)))))).to be(false)
    expect(bst?(Node.new(50, nil, Node.new(30, Node.new(40, Node.new(45), Node.new(20)))))).to be(false)
    expect(bst?(Node.new(50, nil, Node.new(70, Node.new(60, Node.new(55), Node.new(75)))))).to be(false)
    expect(bst?(Node.new(50, Node.new(70, nil, Node.new(60, Node.new(75), Node.new(55)))))).to be(false)
  end

  it 'handles direction tests' do
    expect(bst?(Node.new(500, Node.new(100, Node.new(50, nil, Node.new(75)), Node.new(150, Node.new(125))), Node.new(900, Node.new(800, Node.new(700)), Node.new(1000, nil, Node.new(1100)))))).to be(true)
    expect(bst?((Node.new(500, Node.new(900, Node.new(1000, Node.new(1100), Node.new(800, nil, Node.new(700))), Node.new(100, Node.new(150, nil, Node.new(125)), Node.new(50, Node.new(75)))))))).to be(false)
  end
end
