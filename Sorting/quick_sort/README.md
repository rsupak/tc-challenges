# tcvc-data-structure-challenge
Quick Sort

### Description

Quicksort sorts items in an array in place by partitioning the array.
around a pivot point. Items less than the pivot are returned to the left 
of the pivot; items greater are returned to the right of the array.
The left and right sides are then recursively partitioned the
in a similar manner until the left and right sides are completely
sorted. Once sorted, the method returns the sorted array.

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
bundle exec rspec spec/quick_sort_spec.rb
```
## Notes

# Link to Demo Videos
Demo Video Link
https://youtu.be/3AoJ4DhltHg
