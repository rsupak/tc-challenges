# tcvc-data-structure-challenge

Odd-Even Sort

### Description

In computing, an odd–even sort or odd–even transposition sort is a relatively
simple sorting algorithm, developed originally for use on parallel processors
with local interconnections. It is a comparison sort related to bubble sort,
with which it shares many characteristics. It functions by comparing all
odd/even indexed pairs of adjacent elements in the list and, if a pair is in
the wrong order (the first is larger than the second) the elements are
switched. The next step repeats this for even/odd indexed pairs (of adjacent
elements). Then it alternates between odd/even and even/odd steps until the
list is sorted.

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
ruby lib/odd_even_sort.rb
```


## Running Tests

```bash
bundle exec rspec spec/odd_even_sort_spec.rb
```

## Notes

# Link to Demo Videos

Demo Video Link
https://youtu.be/OIBF3dheNUY
