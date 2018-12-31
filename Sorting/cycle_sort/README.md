# tcvc-data-structure-challenge

Cycle Sort

### Description

Cycle sort is an in-place sorting Algorithm, unstable sorting algorithm, a comparison sort 
that is theoretically optimal in terms of the total number of writes to the original array.

It is optimal in terms of number of memory writes. It minimizes the number of memory writes
to sort (Each value is either written zero times, if it’s already in its correct position,
or written one time to its correct position.)

It is based on the idea that array to be sorted can be divided into cycles. Cycles can be
visualized as a graph. We have n nodes and an edge directed from node i to node j if the
element at i-th index must be present at j-th index in the sorted array.

Cycle in arr[] = {4, 5, 2, 1, 5}

Cycle in arr[] = {4, 3, 2, 1}

We one by one consider all cycles. We first consider the cycle that includes first element.
We find correct position of first element, place it at its correct position, say j. We
consider old value of arr[j] and find its correct position, we keep doing this till all
elements of current cycle are placed at correct position, i.e., we don’t come back to cycle
starting point.

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
ruby lib/cycle_sort.rb
```


## Running Tests

```bash
bundle exec rspec spec/cycle_sort_spec.rb
```

## Notes

# Link to Demo Videos

Demo Video Link
https://youtu.be/0xPnFTdmJXQ
