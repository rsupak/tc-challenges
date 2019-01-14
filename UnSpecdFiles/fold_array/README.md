# tcvc-data-structure-challenge

Fold Array

### Description

In this challenge you have to write a method that folds a given array
of integers by the middle x-times. For example when [1,2,3,4,5] is folded
1 times, it gives [6,6,3] and when folded two times it gives [9,6]. 


The function should take two arguments. An array and int of amout of folds. 


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
ruby lib/fold_array_sort.rb
```


## Running Tests

```bash
bundle exec rspec spec/fold_array_spec.rb
```

## Notes

# Link to Demo Videos

Demo Video Link
https://youtu.be/_JE3_ryN6ro
