# tcvc-data-structure-challenge

Can you count the loop?

## Description

You are given a node that is the beginning of a linked list. This list always
contains a tail and a loop. You will need to create two functions:

```
def create_chain_to_test(tail_size, loop_size)
end
```

```
def loop_size(node)
end
```

Your objective is to determine the length of the loop.
For example in the following picture the tail's size is 3 and the loop size is 11.
The output should be “The tail size is 3 and the loop size is 11”
Create 5 cases in a test file with 2 edge cases and 3 successful outcomes

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
ruby lib/loop_count.rb
```

## Running Tests
```bash
bundle exec rspec spec/loop_count_spec.rb
```
## Notes

## Link to Demo Videos
https://youtu.be/rAn6kKCC8oI
