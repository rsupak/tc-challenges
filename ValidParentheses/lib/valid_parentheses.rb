# validate_paretheses takes a string of paretheses as an argument and 
# determines whether or not the order of the given string is a valid instance
# of parentheses pairs in which each opening parenthesis has a paired closing
# parenthesis. The method checks for a valid input. Empty strings will return
# a warning that the string is empty. Strings of odd lengths will always return
# false as they cannot be paired if the string has an odd length. Should the
# string be validated by length, it is then validated by parings.

def valid_parentheses?(str)
  return 'This is an empty string' if str.length.zero?
  return false if str.length.odd?
  return false if str[0] == ')' # closing parens cannot be first char

  valid_pairs?(str)
end

# valid_pairs? tests the string for partnered parenthesis by adding to a stack
# of open parenthesis when encounter, and removing from the stack if a closed
# parenthesis is encounter. If the end of the string is reached and the last
# open parenthesis is removed on that iteration, the string is valid, but if on 
# any iteration in which an open parenthesis is unable to be removed from the
# stack the string is invalid and returns false.
def valid_pairs?(str)
  open_stack = []
  str.each_char do |char|
    open_stack << char if char == '('
    next unless char == ')'
    return false if open_stack.empty?

    open_stack.pop
  end

  true
end

# test methods
if $PROGRAM_NAME == __FILE__
  puts valid_parentheses?('') # => 'This is an empty string'
  puts valid_parentheses?('(') # => 'false'
  puts valid_parentheses?('()') # => 'true'
  puts valid_parentheses?(')())') # => 'false'
  puts valid_parentheses?('()(())()') # => 'true'
end
