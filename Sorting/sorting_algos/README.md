# tcvc-data-structure-challenge
Bubble Sort and Bucket Sort Algorithms

### Description

Bubble sort and Bucket sor Algorithms are used to sort 
comparable items in an array. Bubble sort, "bubbles" the smaller values
"up" or to the left of an array and larger values are "sink" or move
to the right in the array by comparing the two adjacent values and swapping
the values left if smaller and right if larger.

Bucket sort divides the comparables into buckets, sorts each bucket using 
another sorting algorithm to sort the now smaller collections in each bucket, 
then concatenates the buckets into one larger array, sorted. 

## Prerequisites
1. Ruby 2.5.x
  1. Bundler
1. Rspec

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
```
bundle exec rspec
```

## Notes
# Link to Demo Video
https://youtu.be/t-VBe-900eM
