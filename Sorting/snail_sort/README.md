# tcvc-data-structure-challenge
Shell Sort

### Description

Snail Sort
Given an n x n array, return the array elements arranged from outermost elements 
to the middle element, traveling clockwise.

array = [[1,2,3],
         [4,5,6],
         [7,8,9]]

snail_sort(array) #=> [1,2,3,6,9,8,7,4,5]
NOTE: The idea is not sort the elements from the lowest value to the highest; the idea is to
traverse the 2-d array in a clockwise snailshell pattern.

NOTE 2: The 0x0 (empty matrix) is represented as [[]]

You will need to create a test file. Below is an example test file in ruby. Since you can pick the
language of your choice you need to create your own test file. If you choose javascript you can use
the file given to you below. Your test file should test the 4 cases in the example below 

def test input , expected
  output = snail(input)
  Test.expect(expected == output, "When snail(#{input}) expected #{expected} but got #{output}")
end

test( [[]],[[]],[[]] , "there are no digits in the input arrays")
test( [[1,2,3], [5,6], [8] , "the number inputs in each input array must be the same")
test( [[1,2,3],[4,5,6],[7,8,9]] , [1, 2, 3, 6, 9, 8, 7, 4, 5])
test( [[1,2,3,1],[4,5,6,4],[7,8,9,7],[7,8,9,7] , [1,2,3,1,4,7,7,9,8,7,7,4,5,6,9,8])

## Prerequisites
1. Ruby 2.5.x
2. Bundler
3. Rspec

## Local Deployment
```bash
touch Gemfile
```
using your text editor add the following dependencies to the Gemfile

```
  source "https://rubygems.org"

  gem "byebug"
  gem "rspec"
  gem "pry"
```


## Production Build and Installation
How to build the application for use
```bash
bundle install --binstubs
bin/rspec --init
```

### Manual Deployment Notes
Make sure you run all files from the snail_sort directory

## Running Tests
```bash
bundle exec rspec spec/lib/snail_sort_spec.rb
```
## Notes

# Link to Demo Videos
Demo Video Link
https://youtu.be/TFuG_MdJ73c
