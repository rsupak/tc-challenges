# a BrainF**k interpreter in Ruby
# takes in a code and a string, manipulates string as instructed
# then prints manipulated string to console.
def brain_luck(code, input)
  output = ''
  memory = [0]
  mp = 0 # memory_pointer (points to current location in memory)
  cp = 0 # code_pointer (points to current code operator)
  ip = 0 # input_pointer (points to current input character)

  # manipulate memory or pointer according to the case statement
  # received from the code at the input pointer
  while cp < code.length
    case code[cp]

    # '<' and '>' shifts memory pointer to the designated position
    when '<'
      mp -= 1
      if mp < 0
        mp = 0
        memory.unshift(0)
      end
    when '>'
      mp += 1
      memory << 0 if mp >= memory.length

    # '+' and '-' increments or decrements memory value at the pointer location
    when '+'
      increment(memory, mp)
    when '-'
      decrement(memory, mp)

    # The '[' marks the beginning of a while loop. Because it is simply a marker
    # and doesn't affect the code in any way, I've left it out of the cases.
    # ']' marks the end of a while-loop if the bracket_count = 0 at this marker,
    # the while-loop will end and the input_pointer will move to the next block,
    # if bracket_count != 0, the code_pointer will move back to the previous '['
    # marker and restart the loop.
    when ']'
      if memory[mp] != 0
        bracket_count = 0
        while cp > 0
          cp -= 1
          if code[cp] == ']'
            bracket_count += 1
          elsif code[cp] == '['
            break if bracket_count.zero?

            bracket_count -= 1
          end
        end
      end

    # a ',' marker will read the value at the current input marker and place
    # that ascii value into the memory array at the memory pointer.
    when ','
      memory[mp] = read_byte(input, ip, memory, mp)
      ip += 1

    # a '.' marker will write the data at the current memory location out to
    # the console using the character obtained from the ascii value.
    when '.'
      write_to_output(output, memory, mp)
    end
    cp += 1
  end
  output
end

# increments the value at memory location
def increment(memory, mp)
  memory[mp] += 1
  memory[mp] = 0 if memory[mp] > 255
end

# decrement the value at memory location
def decrement(memory, mp)
  memory[mp] -= 1
  memory[mp] = 255 if memory[mp] < 0
end

# reads character from input string
def read_byte(input, ip, memory, mp)
  memory[mp] = input[ip].ord unless input[ip].nil?
end

# adds ascii character to output string
def write_to_output(output, memory, mp)
  output << memory[mp].chr
end

# Test code used to display correct code when file is run independently
if $PROGRAM_NAME == __FILE__
  p brain_luck(',+[-.,+]', 'Codewars' + 255.chr)
  p brain_luck(',[.[-],]', 'Codewars' + 0.chr)
  p brain_luck(',>,<[>[->+>+<<]>>[-<<+>>]<<<-]>>.', 8.chr + 9.chr)
end
