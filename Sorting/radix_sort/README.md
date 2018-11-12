# tcvc-data-structure-challenge
Radix Sort

### Description
Radix sort is a sorting technique that differs significantly many other sorting
technique. It is a variation on a bucket sort technique that places each item in
a specific bucket according to the value at the least significant digit (when comparing)
integers, and most significant "digit" when comparing strings. This radix sort is 
specifically designed to compare positive and negative integers quickly, by making only
a many passes over the entire array, as there are digits in each specific range.
For example, if the largest number in the array is positive and it contains 3 digits, 
radix sort will only require 3 passes over then entire array to sort the array, 
however, if the largest positive number contains only 2 digits, and the smallest 
negative number contains 4 digits, radix sort will make 6 total passes over the numbers 
before returning a sorted array.


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
  gem "rspec", "~> 3.2.0"
  gem "pry"
```


## Production Build and Installation
How to build the application for use
```bash
bundle install --binstubs
bin/rspec --init
```

### Manual Deployment Notes
because this particular rspec uses `require_relative` 
all files to be tested should also be in the spec directory

## Running Tests
```bash
bundle exec rspec spec/radix_sort_spec.rb
```
## Notes

# Link to Demo Videos
Demo Video Link
https://youtu.be/YCswFAmHMBU
