require './lib/bowling_score'

RSpec.describe 'Bowling score' do
  let(:open_frames) { '11 11 11 11 11 11 11 11 11 11' }
  let(:perfect_game) { 'X X X X X X X X X XXX' }
  let(:unfinished_game) { '12 4/ 81 X 53' }
  let(:zero_scores) { '00 45 09 X 23 62 7/ 34 34 0/9' }
  it 'scores all open frames' do
    # maybe this bowler should put bumpers on
    expect(bowling_score(open_frames)).to eq(20)
  end

  it 'scores a perfect game' do
    # woah! Perfect game!
    expect(bowling_score(perfect_game)).to eq(300)
  end

  it 'returns score in the middle of the game' do
    # test during the middle of a game
    expect(bowling_score(unfinished_game)).to eq(56)
  end

  it 'handles 0 scores' do
    # test with zeroes
    expect(bowling_score(zero_scores)).to eq(92)
  end
end
