# tcvc-data-structure-challenge

Pancake Sort

### Description

Pancake Sort

Given an an unsorted array, sort the given array. You are allowed to do only
following operation on array.

flip(array, end_point): Reverse array from 0 to i

Unlike a traditional sorting algorithm, which attempts to sort with the
fewest comparisons possible, the goal is to sort the sequence in as few
reversals as possible.

The idea is to do something similar to Selection Sort. We one by one place
maximum element at the end and reduce the size of current array by one.

Following are the detailed steps. Let given array be arr[] and size of array
be n.

Start from current size equal to n and reduce current size by one while
it is greater than 1. Let the current size be curr_size. Do following for
every curr_size

a) Find index of the maximum element in arr[0..curr_size-1].
   Let the index be 'max_index'.
b) Call flip(array, max_index)
c) Call flip(array, curr_size-1)

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
The following command will run the sorting method from the main
directory.

```bash
ruby lib/pancake_sort.rb
```


## Running Tests

```bash
bundle exec rspec spec/pancake_sort_spec.rb
```

## Notes

# Link to Demo Videos

Demo Video Link
https://youtu.be/wUTkGUiYGI0
