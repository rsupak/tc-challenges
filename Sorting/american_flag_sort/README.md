# tcvc-data-structure-challenge

American Flag Sort

### Description

An American flag sort is an efficient, in-place variant of radix sort that
distributes items into buckets. Non-comparative sorting algorithms such as
radix sort and American flag sort are typically used to sort large objects
such as strings, for which comparison is not a unit-time operation. American
flag sort iterates through the bits of the objects, considering several bits
of each object at a time. For each set of bits, American flag sort makes two
passes through the array of objects: first to count the number of objects
that will fall in each bin, and second to place each object in its bucket.
This works especially well when sorting a byte at a time, using 256 buckets.
With some optimizations, it is twice as fast as quicksort for large sets of
strings. https://en.wikipedia.org/wiki/American_flag_sort

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
ruby lib/american_flag_sort.rb
```


## Running Tests

```bash
bundle exec rspec spec/american_flag_sort_spec.rb
```

## Notes

# Link to Demo Videos

Demo Video Link
https://youtu.be/rv39HitKnuk
