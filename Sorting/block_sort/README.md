# tcvc-data-structure-challenge
Block Sort

### Description


Block sort, or block merge sort, is a sorting algorithm combining at least two merge operations 
with an insertion sort to arrive at O(n log n) in-place stable sorting. It gets its name from the 
observation that merging two sorted lists, A and B, is equivalent to breaking A into evenly sized 
blocks, inserting each A block into B under special rules, and merging AB pairs.
https://en.wikipedia.org/wiki/Block_sort

block sort method heavily relies on the interpretation of
wikipedia's block-merge-sort and java implementation of 
BonzaiThePenguin's write-up on Block Sort (WikiSort)
https://github.com/BonzaiThePenguin/WikiSort/blob/master/WikiSort.java
without which, this project would not have been completed.

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
bundle exec rspec spec/block_sort_spec.rb
```
## Notes

# Link to Demo Videos
Demo Video Link
https://youtu.be/XvQn3CCN1fg
