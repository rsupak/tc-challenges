# tcvc-data-structure-challenge

Bogo Sort

### Description

Bogosort

In computer science, bogosort (also known as permutation sort, stupid sort, slowsort,
shotgun sort or monkey sort) is a highly ineffective sorting function based on the 
generate and test paradigm. The function successively generates permutations of its 
input until it finds one that is sorted. It is not useful for sorting, but may be 
used for educational purposes, to contrast it with more efficient algorithms.

Two versions of the function exist: a deterministic version that enumerates all 
permutations until it hits a sorted one, and a randomized version that randomly permutes 
its input. An analogy for the working of the latter version is to sort a deck of cards by 
throwing the deck into the air, picking the cards up at random, and repeating the process 
until the deck is sorted. Because of the random nature of the sort, the time complexity
is best case O(n) and worst case O((n+1)!)

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
bundle exec rspec spec/bogo_sort_spec.rb
```

## Notes

# Link to Demo Videos

Demo Video Link
https://youtu.be/qf0C3Y806XU
