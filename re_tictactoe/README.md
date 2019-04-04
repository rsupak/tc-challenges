# tcvc-data-structure-challenge

Regex Tic Tac Toe Checker

Your function will receive a string of nine "X", "O", and/or "-"
characters representing the state of a tic tac toe board, for example
the string

"X-OXXXO-O"
would represent the board

X-O
XXX
O-O
where player X has won by getting three in a row horizontally on the middle 
row.

Your function needs to return "X or O wins" (depending on who wins) if either
the X or the O player has won the game by getting three in a row vertically,
horizontally, or diagonally; or "No winner" if there is no winner. If there is
no winner but empty spaces return "Keep Playing"

### Description


## Prerequisites
1. Ruby 2.5.x
2. Bundler
3. Rspec

## Local Deployment
```bash
bundle install
```

## Production Build and Installation

### Manual Deployment Notes

```bash
ruby lib/re_ttt_checker.rb
```

## Running Tests
```bash
bundle exec rspec spec/re_ttt_checker_spec.rb
```
## Notes

# Link to Demo Videos
Demo Video Link
https://youtu.be/ivcogvMLUjE
