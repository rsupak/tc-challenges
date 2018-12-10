# tcvc-data-structure-challenge

Comb Sort

### Description

Comb sort is an exchange sort that improves the array access time over
bubble sort. One of the greatest shortcomings of bubble sort is when the
smallest values are gathered toward the end of the array ('turtles'). Bubble
sort has a constant gap comparison of 1, and the turtles increase the 
look-back over the entire array. Comb sort attempts to minimize this
issue by allowing for a greater gap comparison which would then bring the
turtles toward the middle and beginning of the array during each pass.
Comb sort worst case scenario runs at O(n^2). 

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

because this particular rspec uses `require_relative`
all files to be tested should also be in the spec directory

## Running Tests

```bash
bundle exec rspec spec/comb_sort_spec.rb
```

## Notes

# Link to Demo Videos

Demo Video Link
https://youtu.be/P8c4F4TdSr0
