# Regex Tic Tac Toe Checker

# Your function will receive a string of nine "X", "O", and/or "-"
# characters representing the state of a tic tac toe board, for example
# the string

# "X-OXXXO-O"
# would represent the board

# X-O
# XXX
# O-O
# where player X has won by getting three in a row horizontally on the middle 
# row.

# Your function needs to return "X or O wins" (depending on who wins) if either
# the X or the O player has won the game by getting three in a row vertically,
# horizontally, or diagonally; or "No winner" if there is no winner. If there is
# no winner but empty spaces return "Keep Playing"

# capture group 1 sets the back reference
# capture group 2 matches any horizontal matches
# capture group 3 matches diagonal match from top right to bottom left
# capture group 4 matches vertical matches
# capture group 5 matches diagonal match from top left to bottom right

WIN = /(\w)(..(\1|.\1.)..\1|.\1.\1..$|\1\1(...)*$)/.freeze

def re_ttt_checker(string)
  if string =~ WIN
    winner = string.match(/(\w)/)
    return "#{winner} wins"
  end
  return 'Keep Playing' if string.include?('-') && !string.match(WIN)

  'No Winner'
end

# test block
if $PROGRAM_NAME == __FILE__
  test_group_winners = ['XXX-O-O-O',
                        'X--OOOX-X',
                        'O--OO-XXX',
                        'O-XOX-O-X',
                        'OXOOXOXX-',
                        'X-O-OOXXO',
                        'XO--X-OOX',
                        'X--OOOX-X']

  test_group_kps = ['XO-------',
                    'XX-XOO---',
                    'XXO------',
                    '---------']

  test_group_nws = %w[OXXXOOXOX
                      OXOXOXXOX
                      OOXXXOOOX]

  test_group_winners.each do |winner|
    puts re_ttt_checker(winner)
  end

  test_group_kps.each do |playing|
    puts re_ttt_checker(playing)
  end

  test_group_nws.each do |no_winners|
    puts re_ttt_checker(no_winners)
  end
end
