# main method
def damaged_or_sunk(board, attacks)
  score_assault(board, attacks)
end

# establishes boat locations in the board
def mark_boats(board)
  boats = {}
  board.each.with_index do |row, i|
    row.each.with_index do |col, j|
      if boats[col].nil?
        boats[col] = [[j + 1, i + 1]] unless col.zero?
      else
        boats[col] << [j + 1, i + 1] unless col.zero?
      end
    end
  end
  boats
end

# marks hits on boats after attacks
def mark_attacks(board, attacks)
  boats = mark_boats(board.reverse)
  attacks.each do |attack|
    boats.keys.each do |k|
      boats[k].each.with_index do |boat, i|
        boats[k][i] = 'X' if boat == attack
      end
    end
  end
  boats
end

# checks each boat for hits, then scores sinks, hits, and misses
def score_assault(board, attacks)
  score = { 'sunk' => 0, 'damaged' => 0, 'not_touched' => 0, 'points' => 0 }
  boats = mark_attacks(board, attacks)
  boats.keys.each do |k|
    if boats[k].all?('X')
      score['sunk'] += 1
      score['points'] += 1
    elsif boats[k].any?('X')
      score['damaged'] += 1
      score['points'] += 0.5
    else
      score['not_touched'] += 1
      score['points'] -= 1
    end
  end
  score
end

# test block when file is run
if $PROGRAM_NAME == __FILE__
  board = [[0, 0, 0, 2, 2, 0],
           [0, 3, 0, 0, 0, 0],
           [0, 3, 0, 1, 0, 0],
           [0, 3, 0, 1, 0, 0]]

  attacks = [[2, 1], [1, 3], [4, 2]]
  p damaged_or_sunk(board, attacks)
end
