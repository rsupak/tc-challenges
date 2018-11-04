# tcvc-data-structure-challenge
Selection Sort

### Description

Selection sort is a sorting algorithm, specifically an in-place comparison sort.
The algorithm divides the input list into two parts: the sublist of items already sorted,
which is built up from left to right at the front (left) of the list, and the sublist of
items remaining to be sorted that occupy the rest of the list. Initially, the sorted
sublist is empty and the unsorted sublist is the entire input list. The algorithm proceeds
by finding the smallest (or largest, depending on sorting order) element in the unsorted
sublist, exchanging (swapping) it with the leftmost unsorted element (putting it in sorted order),
and moving the sublist boundaries one element to the right.

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
bundle exec rspec spec/selection_sort_spec.rb
```
## Notes

# Link to Demo Videos
Demo Video Link
