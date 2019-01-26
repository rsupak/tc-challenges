# tcvc-challenge
Code interpreter

### Description

We want to create an interpreter of that language which will support the following instructions 
(the machine memory or 'data' should behave like a potentially infinite array of bytes, initialized to 0):

> increment the data pointer (to point to the next cell to the right).
< decrement the data pointer (to point to the next cell to the left).
+ increment (increase by one, truncate overflow: 255 + 1 = 0) the byte at the data pointer.
- decrement (decrease by one, treat as unsigned byte: 0 - 1 = 255 ) the byte at the data pointer.
. output the byte at the data pointer.
, accept one byte of input, storing its value in the byte at the data pointer.
[ if the byte at the data pointer is zero, then instead of moving the instruction pointer forward 
to the next command, jump it forward to the command after the matching ] command.

] if the byte at the data pointer is nonzero, then instead of moving the instruction pointer forward 
to the next command, jump it back to the command after the matching [ command.

The function will take in 2 arguments...

the program code, a string with the sequence of machine instructions,
the program input, a string, eventually empty, that will be interpreted as an array of bytes using each 
character's ASCII code and will be consumed by the , instruction
... and will return ...

the output of the interpreted code (always as a string), produced by the .instruction.

## Prerequisites
1. Ruby 2.5.x
2. Bundler
3. Rspec

## Local Deployment


## Production Build and Installation
How to build the application for use
```bash
bundle install
```

### Manual Deployment Notes
Testing methods have been added in the `if $PROGRAM_NAME` block if deployed individually

## Running Tests
```bash
bundle exec rspec spec/interpreter_spec.rb
```
## Notes
```bash
ruby interpreter.rb
```
will run the file independently and print the test code to the console.

# Link to Demo Videos
Demo Video Link
