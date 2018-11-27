# tcvc-data-structure-challenge

Counting Sort

### Description

Counting sort is an algorithm for sorting a collection of objects
according to keys that are small integers; that is, it is an integer
sorting algorithm. It operates by counting the number of objects that
have each distinct key value, and using arithmetic on those counts to
determine the positions of each key value in the output sequence. Its
running time is linear in the number of items and the difference between
the maximum and minimum key values, so it is only suitable for direct use
in situations where the variation in keys is not significantly greater than
the number of items. Counting sort's worst time complexity is O(n^2).

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
bundle exec rspec
```

## Notes

# Link to Demo Videos

Demo Video Link
https://youtu.be/SMCWcqpf_HE
