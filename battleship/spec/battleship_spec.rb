require_relative '../lib/battleship'

RSpec.describe '#damaged_or_sunk' do
  # test_board set-up (for individual tests)
  let(:test_board) do
    [[0, 0, 0, 0, 0, 0],
     [0, 3, 0, 0, 0, 0],
     [0, 3, 0, 0, 0, 0],
     [0, 3, 0, 0, 0, 0]]
  end

  # board set-up (for main test)
  let(:board) do
    [[0, 0, 0, 2, 2, 0],
     [0, 3, 0, 0, 0, 0],
     [0, 3, 0, 1, 0, 0],
     [0, 3, 0, 1, 0, 0]]
  end

  # attacks
  let(:attacks_1) { [[2, 1], [1, 3], [4, 2]] }
  let(:attacks_2) { [[2, 1], [2, 2], [2, 3]] }
  let(:attacks_3) { [[1, 1], [1, 2], [1, 3]] }

  it 'marks and scores a hit' do
    expect(damaged_or_sunk(test_board, attacks_1)).to eq(
      'sunk' => 0, 'damaged' => 1, 'not_touched' => 0, 'points' => 0.5
    )
  end

  it 'marks and scores a sunken ship' do
    expect(damaged_or_sunk(test_board, attacks_2)).to eq(
      'sunk' => 1, 'damaged' => 0, 'not_touched' => 0, 'points' => 1
    )
  end

  it 'marks and scores a miss' do
    expect(damaged_or_sunk(test_board, attacks_3)).to eq(
      'sunk' => 0, 'damaged' => 0, 'not_touched' => 1, 'points' => -1
    )
  end

  it 'marks and scores hits and misses' do
    expect(damaged_or_sunk(board, attacks_1)).to eq(
      'sunk' => 0, 'damaged' => 2, 'not_touched' => 1, 'points' => 0
    )
  end
end
