require 're_ttt_checker'

describe '#re_ttt_checker' do
  let(:winners) { ['XXX-O-O-O',
                   'X--OOOX-X',
                   'O--OO-XXX',
                   'O-XOX-O-X',
                   'OXOOXOXX-',
                   'X-O-OOXXO',
                   'XO--X-OOX',
                   'X-OXOOOXX'] }

  let(:keep_playing) { ['XO-------',
                        'XX-XOO---',
                        'XXO------',
                        '---------'] }

  let(:no_winners) { %w[OXXXOOXOX OXOXOXXOX OOXXXOOOX] }

  it 'checks for winners' do
    winners.each do |test|
      winner = test.match(/(\w)/)
      expect(re_ttt_checker(test)).to eq("#{winner} wins")
    end
  end

  it 'checks for keep playing with open board and no winners' do
    keep_playing.each do |test|
      expect(re_ttt_checker(test)).to eq('Keep Playing')
    end
  end

  it 'checks for closed board and no winners' do
    no_winners.each do |test|
      expect(re_ttt_checker(test)).to eq('No Winner')
    end
  end
end
