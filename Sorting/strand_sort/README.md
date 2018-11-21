# tcvc-data-structure-challenge
Strand Sort

### Description

Strand sort is a merge sort variant that builds strands of sorted subarrays
then merges the strand into the main sorted sub array. The strands are build
by setting the initial comparison value as the first item in the array,
then it iterates over the array until it finds a number greater than the
value then adds the value to the strand array sets the value to the found
number. It continues build the strand with greater values until the end of
the array. Then it merges the strand into the sorted final array.

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
bundle exec rspec spec/strand_sort_spec.rb
```
## Notes

# Link to Demo Videos
Demo Video Link

https://youtu.be/P2aRCOC5UlY
