# tcvc-data-structure-challenge
Merge Sort

### Description

Merge sort is an incredibly time-efficient sorting method. It takes an
array and breaks it down to individual comparables. Then rebuilds the
array by placing the compared elements into a new array. It does this
dividing the array into halves, recursively until there is only one
element in each sub-array. Then it merges the 2 sub-arrays by comparing
the first elements removing them and placing those elements, sorted, into
a new array. Once those sub-arrays are exhausted, it moves up the
recursion until all elements have been merged into a new sorted array.

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
bundle exec rspec spec/merge_sort_spec.rb
```
## Notes

# Link to Demo Videos
Demo Video Link
https://youtu.be/KM-th7eobkQ
